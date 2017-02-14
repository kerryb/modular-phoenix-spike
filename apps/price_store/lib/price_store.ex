defmodule PriceStore do
  alias PriceStore.Store

  def current_price do
    Store.read()
  end

  def refresh do
    Store.read()
    |> (fn p -> p + 1 end).()
    |> Store.save
  end
end
