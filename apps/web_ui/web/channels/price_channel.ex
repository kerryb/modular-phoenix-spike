defmodule WebUi.PriceChannel do
  use Phoenix.Channel
  alias WebUi.Endpoint

  def join("price", _message, socket) do
    {:ok, socket}
  end

  def update_price(price) do
    Endpoint.broadcast! "price", "new_price", %{price: price.price}
  end
end
