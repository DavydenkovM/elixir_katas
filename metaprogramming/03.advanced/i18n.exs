defmodule Translator do
  defmacro __using__(_options) do
    quote do
      Module.register_attribute __MODULE__, :locales, accumulate: true, persist: false
      import unquote(__MODULE__), only: [locale: 2]
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(env) do
    compile(Module.get_attribute(env.module, :locales))
  end

  defmacro locale(name, mappings) do
    quote bind_quoted: [name: name, mappings: mappings] do
      @locales {name, mappings}
    end
  end

  def compile(translations) do
    translations_ast = for {locale, mappings} <- translations do
      deftranslations(locale, "", mappings)
    end

    final_ast = quote do
      def t(locale, path, bindings \\ []) # emtpy, just for default values
      unquote(translations_ast)
      def t(_locale, _path, _bindings), do: {:error, :no_translation}
    end

    # IO.inspect final_ast
    # IO.puts Macro.to_string(final_ast)
    final_ast
  end

  def deftranslations(locale, current_path, mappings) do
    for {key, val} <- mappings do
      path = append_path(current_path, key)

      if Keyword.keyword?(val) do
        deftranslations(locale, path, val)
      else
        quote do
          def t(unquote(locale), unquote(path), bindings) do
            unquote(interpolate(val))
          end
        end
      end
    end
  end

  def interpolate(string) do
    ~r/(?<head>)%{[^}]+}(?<tail>)/
    |> Regex.split(string, on: [:head, :tail])
    |> Enum.reduce("", fn
      <<"%{" <> rest>>, acc ->
        key = String.to_atom(String.rstrip(rest, ?}))
        quote do
          IO.inspect bindings
          unquote(acc) <> to_string(Dict.fetch!(bindings, unquote(key)))
        end
      segment, acc ->
        quote do: (unquote(acc) <> unquote(segment))
    end)
  end

  def append_path("", next), do: to_string(next)
  def append_path(current, next), do: "#{current}.#{next}"
end


# USAGE
defmodule I18n do
  use Translator

  locale "en",
    flash: [
      hello: "Hello %{first} %{last}!",
      bye: "Bye, %{name}!"
    ],
    users: [
      title: "Users"
    ]

  locale "fr",
    flash: [
      hello: "Salut %{first} %{last}!",
      bye: "Au revoir, %{name}!"
    ],
    users: [
      title: "Utilisateurs"
    ]
end

## I18n.t("en", "flash.hello", first: "Chris", last: "McCord")
## "Hello Chris Mccord!"
## I18n.t("fr", "flash.hello", first: "Chris", last: "McCord")
## "Salut Chris McCord!"
## I18n.t("en", "users.title")
## "Users"
