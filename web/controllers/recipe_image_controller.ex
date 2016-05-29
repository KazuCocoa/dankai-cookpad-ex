defmodule Dankai.RecipeImageController do
  use Dankai.Web, :controller

  alias Dankai.RecipeImage

  plug :scrub_params, "recipe_image" when action in [:create, :update]

  def index(conn, _params) do
    recipe_images = Repo.all(RecipeImage)
    render(conn, "index.html", recipe_images: recipe_images)
  end

  def new(conn, _params) do
    changeset = RecipeImage.changeset(%RecipeImage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"recipe_image" => recipe_image_params}) do
    changeset = RecipeImage.changeset(%RecipeImage{}, recipe_image_params)

    case Repo.insert(changeset) do
      {:ok, _recipe_image} ->
        conn
        |> put_flash(:info, "Recipe image created successfully.")
        |> redirect(to: recipe_image_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe_image = Repo.get!(RecipeImage, id)
    render(conn, "show.html", recipe_image: recipe_image)
  end

  def edit(conn, %{"id" => id}) do
    recipe_image = Repo.get!(RecipeImage, id)
    changeset = RecipeImage.changeset(recipe_image)
    render(conn, "edit.html", recipe_image: recipe_image, changeset: changeset)
  end

  def update(conn, %{"id" => id, "recipe_image" => recipe_image_params}) do
    recipe_image = Repo.get!(RecipeImage, id)
    changeset = RecipeImage.changeset(recipe_image, recipe_image_params)

    case Repo.update(changeset) do
      {:ok, recipe_image} ->
        conn
        |> put_flash(:info, "Recipe image updated successfully.")
        |> redirect(to: recipe_image_path(conn, :show, recipe_image))
      {:error, changeset} ->
        render(conn, "edit.html", recipe_image: recipe_image, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe_image = Repo.get!(RecipeImage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(recipe_image)

    conn
    |> put_flash(:info, "Recipe image deleted successfully.")
    |> redirect(to: recipe_image_path(conn, :index))
  end
end
