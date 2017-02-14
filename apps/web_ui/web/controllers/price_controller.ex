defmodule WebUi.PriceController do
  use WebUi.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:price, PriceStore.current_price)
    |> render("index.html")
  end

  def refresh(conn, _params) do
    PriceStore.refresh()
    redirect conn, to: "/"
  end
end
