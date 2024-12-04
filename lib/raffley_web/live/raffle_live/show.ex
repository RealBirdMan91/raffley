defmodule RaffleyWeb.RaffleLive.Show do
  use RaffleyWeb, :live_view
  alias Raffley.Raffles
  import RaffleyWeb.CustomComponents

  def mount(%{"id" => id}, _session, socket) do
    raffle = Raffles.get_raffle!(id)

    {:ok,
     assign(socket,
       raffle: raffle,
       featured_raffles: Raffles.featured_raffles(raffle),
       page_title: raffle.prize
     )}
  end

  def render(assigns) do
    ~H"""
    <div class="raffle-show">
      <div class="raffle">
        <img src={@raffle.image_path} alt={@raffle.prize} />
        <section>
          <.badge status={@raffle.status} />
          <header>
            <h2><%= @raffle.prize %></h2>
            <div class="price">
              $<%= @raffle.ticket_price %> per ticket
            </div>
          </header>
          <div class="description">
            <%= @raffle.description %>
          </div>
        </section>
      </div>
      <div class="activity">
        <div class="left"></div>
        <div class="right">
          <.featured_raffles raffles={@featured_raffles} />
        </div>
      </div>
    </div>
    """
  end

  def featured_raffles(assigns) do
    ~H"""
    <section>
      <h4>Featured Raffles</h4>
      <ul class="raffles">
        <li :for={raffle <- @raffles}>
          <.link navigate={~p"/raffles/#{raffle}"}>
            <img src={raffle.image_path} alt={raffle.prize} />
            <h5><%= raffle.prize %></h5>
          </.link>
        </li>
      </ul>
    </section>
    """
  end
end
