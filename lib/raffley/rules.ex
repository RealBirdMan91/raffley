defmodule Raffley.Rules do
  def get_rule(id) when is_integer(id) do
    Enum.find(list_rules(), fn rule -> rule.id == id end)
  end

  def get_rule(id) when is_binary(id) do
    Enum.find(list_rules(), fn rule -> rule.id == String.to_integer(id) end)
  end

  def list_rules do
    [
      %{
        id: 1,
        text: "The first rule of Raffley is you do not talk about Raffley."
      },
      %{
        id: 2,
        text: "The second rule of Raffley is you DO NOT talk about Raffley."
      },
      %{
        id: 3,
        text: "If someone says 'stop' or goes limp, taps out the raffle is over."
      },
      %{
        id: 4,
        text: "Only two guys to a raffle."
      },
      %{
        id: 5,
        text: "One raffle at a time."
      },
      %{
        id: 6,
        text: "No shirts, no shoes."
      }
    ]
  end
end
