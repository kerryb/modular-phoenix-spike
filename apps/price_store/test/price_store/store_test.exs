defmodule PriceStore.StoreTest do
  use ExUnit.Case
  alias PriceStore.Store
  doctest Store

  setup do
    Store.start_link()

    on_exit fn -> Store.stop end
  end

  test "initialises to zero" do
    assert Store.read().price == 0
  end

  test "can store a value" do 
    Store.save 42
    assert Store.read().price == 42
  end

  test "tracks the date the value was set" do 
    Store.save 42
    assert_in_delta((Store.read().timestamp |> DateTime.to_unix),
                    (DateTime.utc_now |> DateTime.to_unix),
                    1)
  end
end
