defmodule WebUi.PriceController do
  use WebUi.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:price, PriceStore.current_price.price)
    |> assign(:timestamp, PriceStore.current_price.timestamp)
    |> render("index.html")
  end

  def refresh(conn, _params) do
    PriceStore.refresh()
    redirect conn, to: "/"
  end
end
