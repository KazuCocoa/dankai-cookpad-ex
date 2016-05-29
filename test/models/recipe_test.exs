defmodule Dankai.RecipeTest do
  use Dankai.ModelCase

  alias Dankai.Recipe

  @valid_attrs %{name: "some content", view_count: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Recipe.changeset(%Recipe{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Recipe.changeset(%Recipe{}, @invalid_attrs)
    refute changeset.valid?
  end
end
