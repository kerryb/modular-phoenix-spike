defmodule WebUi.PriceController do
  use WebUi.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:price, "???")
    |> render("index.html")
  end
end
