defmodule PriceStore do
  alias PriceStore.Store

  def current_price do
    Store.read()
  end
end
