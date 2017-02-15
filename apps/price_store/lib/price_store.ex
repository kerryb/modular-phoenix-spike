defmodule PriceStore do
  alias PriceStore.Store
  alias PriceStore.RefreshTimer

  def current_price do
    Store.read()
  end

  def refresh do
    "http://finance.google.com/finance/info?client=ig&q=LON:BT.A"
    |> HTTPotion.get([ibrowse: proxy_options()])
    |> Map.get(:body)
    |> String.replace(~r/^[^[]*/, "")
    |> Poison.decode!
    |> List.first
    |> Map.get("l")
    |> Store.save
  end

  def subscribe(function), do: RefreshTimer.subscribe function

  defp proxy_options do
    case System.get_env "http_proxy" do
      nil -> []
      http_proxy = _ ->
        %{host: host, port: port} = URI.parse http_proxy
        [proxy_host: host |> String.to_charlist, proxy_port: port]
    end
  end
end
