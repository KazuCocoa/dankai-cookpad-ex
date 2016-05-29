defmodule Dankai.RecipeImageControllerTest do
  use Dankai.ConnCase

  alias Dankai.RecipeImage
  @valid_attrs %{digest: "some content", path: "some content", recipe_id: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, recipe_image_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing recipe images"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, recipe_image_path(conn, :new)
    assert html_response(conn, 200) =~ "New recipe image"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, recipe_image_path(conn, :create), recipe_image: @valid_attrs
    assert redirected_to(conn) == recipe_image_path(conn, :index)
    assert Repo.get_by(RecipeImage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, recipe_image_path(conn, :create), recipe_image: @invalid_attrs
    assert html_response(conn, 200) =~ "New recipe image"
  end

  test "shows chosen resource", %{conn: conn} do
    recipe_image = Repo.insert! %RecipeImage{}
    conn = get conn, recipe_image_path(conn, :show, recipe_image)
    assert html_response(conn, 200) =~ "Show recipe image"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, recipe_image_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    recipe_image = Repo.insert! %RecipeImage{}
    conn = get conn, recipe_image_path(conn, :edit, recipe_image)
    assert html_response(conn, 200) =~ "Edit recipe image"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    recipe_image = Repo.insert! %RecipeImage{}
    conn = put conn, recipe_image_path(conn, :update, recipe_image), recipe_image: @valid_attrs
    assert redirected_to(conn) == recipe_image_path(conn, :show, recipe_image)
    assert Repo.get_by(RecipeImage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    recipe_image = Repo.insert! %RecipeImage{}
    conn = put conn, recipe_image_path(conn, :update, recipe_image), recipe_image: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit recipe image"
  end

  test "deletes chosen resource", %{conn: conn} do
    recipe_image = Repo.insert! %RecipeImage{}
    conn = delete conn, recipe_image_path(conn, :delete, recipe_image)
    assert redirected_to(conn) == recipe_image_path(conn, :index)
    refute Repo.get(RecipeImage, recipe_image.id)
  end
end
