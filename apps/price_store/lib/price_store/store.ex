defmodule PriceStore.Store do
  def start_link do
    Agent.start_link fn -> 0 end, name: __MODULE__
  end

  def save(value) do
    Agent.update __MODULE__, fn(_) -> value end
  end

  def read do
    Agent.get __MODULE__, &(&1)
  end
end
