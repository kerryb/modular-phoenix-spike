defmodule PriceStore.StoreTest do
  use ExUnit.Case
  alias PriceStore.Store
  doctest Store

  test "initialises to zero" do
    assert Store.read() == 0
  end

  test "can store a value" do 
    Store.save 42
    assert Store.read() == 42
  end
end
