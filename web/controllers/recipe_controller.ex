defmodule Dankai.RecipeController do
  use Dankai.Web, :controller

  alias Dankai.Recipe
  alias Dankai.Pv

  plug :scrub_params, "recipe" when action in [:create, :update]
  plug :record_pv, "index" when action in [:index]

  def index(conn, _params) do
    recipes = Recipe
              |> Ecto.Query.preload(:steps)
              |> Repo.paginate

    render(
      conn, "index.html",
      page: recipes,
      recipes: recipes.entries,
      page_number: recipes.page_number,
      page_size: recipes.page_size,
      total_pages: recipes.total_pages,
      total_entries: recipes.total_entries
    )
  end

  def new(conn, _params) do
    changeset = Recipe.changeset(%Recipe{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    changeset = Recipe.changeset(%Recipe{}, recipe_params)

    case Repo.insert(changeset) do
      {:ok, _recipe} ->
        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: recipe_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Recipe.viewed!(id)
    render(conn, "show.html", recipe: recipe)
  end

  def edit(conn, %{"id" => id}) do
    recipe = Repo.get!(Recipe, id)
    changeset = Recipe.changeset(recipe)
    render(conn, "edit.html", recipe: recipe, changeset: changeset)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Repo.get!(Recipe, id)
    changeset = Recipe.changeset(recipe, recipe_params)

    case Repo.update(changeset) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: recipe_path(conn, :show, recipe))
      {:error, changeset} ->
        render(conn, "edit.html", recipe: recipe, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Repo.get!(Recipe, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(recipe)

    conn
    |> put_flash(:info, "Recipe deleted successfully.")
    |> redirect(to: recipe_path(conn, :index))
  end

  def record_pv(conn, param) do
    %Pv{}
    |> Pv.changeset(%{controller: "#{__MODULE__}", action: param})
    |> Repo.insert!
    conn
  end
end
