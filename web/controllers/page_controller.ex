defmodule Dankai.PageController do
  use Dankai.Web, :controller

  alias Dankai.Recipe
  alias Dankai.Step
  alias Dankai.RecipeImage
  alias Dankai.Pv

  def index(conn, _params) do
    render conn, "index.html"
  end

  def initialize(conn, _params) do
    from(recipe in Recipe, where: recipe.id < 100000) |> Repo.delete_all
    Repo.update_all(Recipe, set: [view_count: 0])
    from(step in Step, where: step.id < 400000) |> Repo.delete_all
    Repo.delete_all(RecipeImage)
    Repo.delete_all(Pv)

    recipe_image_dir = Path.join Dankai.Endpoint.config(:root), "public/uploads/recipe_images"
    File.rm_rf! recipe_image_dir
    File.mkdir_p! recipe_image_dir

    render conn, "index.html"
  end
end
