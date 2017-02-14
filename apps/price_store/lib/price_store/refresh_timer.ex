defmodule PriceStore.RefreshTimer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    send self(), :tick
    {:ok, state}
  end

  def handle_info(:tick, state) do
    PriceStore.refresh()
    Process.send_after self(), :tick, 5000
    {:noreply, state}
  end
end
