defmodule Dankai.RecipeImageTest do
  use Dankai.ModelCase

  alias Dankai.RecipeImage

  @valid_attrs %{digest: "some content", path: "some content", recipe_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RecipeImage.changeset(%RecipeImage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RecipeImage.changeset(%RecipeImage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
