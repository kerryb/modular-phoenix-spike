defmodule PriceStore.Store do
  alias PriceStore.Price

  def start_link, do: Agent.start_link fn -> %Price{} end, name: __MODULE__
  def stop, do: Agent.stop __MODULE__

  def save(value) do
    Agent.update __MODULE__, fn(_) -> %Price{price: value, timestamp: DateTime.utc_now} end
  end

  def read do
    Agent.get __MODULE__, &(&1)
  end
end
