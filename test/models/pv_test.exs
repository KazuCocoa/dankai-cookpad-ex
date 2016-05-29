defmodule Dankai.PvTest do
  use Dankai.ModelCase

  alias Dankai.Pv

  @valid_attrs %{action: "some content", controller: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pv.changeset(%Pv{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pv.changeset(%Pv{}, @invalid_attrs)
    refute changeset.valid?
  end
end
