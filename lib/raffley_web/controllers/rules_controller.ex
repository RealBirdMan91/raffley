defmodule RaffleyWeb.RulesController do
  use RaffleyWeb, :controller
  alias Raffley.Rules

  def index(conn, _params) do
    emojis = ~w"🎲 🎰 🎱 🎳 🎮 🎯 🎲 🎰 🎱 🎳 🎮 🎯" |> Enum.shuffle()
    rules = Rules.list_rules()

    render(conn, :index, emojis: emojis, rules: rules)
  end

  def show(conn, %{"id" => id}) do
    rule = Rules.get_rule(id)
    render(conn, :show, rule: rule)
  end
end
