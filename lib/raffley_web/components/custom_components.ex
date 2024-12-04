defmodule RaffleyWeb.CustomComponents do
  use RaffleyWeb, :html

  attr :status, :atom, required: true, values: [:upcoming, :open, :closed]
  attr :class, :string, default: nil

  def badge(assigns) do
    ~H"""
    <div class={[
      " rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
      @status == :open && "text-lime-600 border-lime-600",
      @status == :upcoming && "text-amber-600 border-amber-600",
      @status == :closed && "text-gray-600 border-gray-600",
      @class
    ]}>
      <%= @status %> tickets sold
    </div>
    """
  end

  slot :inner_block, required: true
  slot :details

  def banner(assigns) do
    assigns = assign(assigns, emoji: ~w"🎉 🎁 🎈" |> Enum.random())

    ~H"""
    <div class="banner rounded-md shadow-md">
      <h1><%= render_slot(@inner_block, @emoji) %></h1>
      <div :if={@details != []} class="details">
        <%= render_slot(@details) %>
      </div>
    </div>
    """
  end
end
