defmodule PriceStore.RefreshTimer do
  use GenServer

  def start_link do
    GenServer.start_link __MODULE__, [], name: __MODULE__
  end

  def init(subscribers) do
    send self(), :tick
    {:ok, subscribers}
  end

  def subscribe(function) do
    GenServer.cast __MODULE__, {:subscribe, function}
  end

  def handle_info(:tick, subscribers) do
    PriceStore.refresh()
    Process.send_after self(), :tick, 5000
    Enum.map subscribers, fn sub -> sub.(PriceStore.current_price) end
    {:noreply, subscribers}
  end

  def handle_cast({:subscribe, function}, subscribers) do
    {:noreply, [function | subscribers]}
  end
end
