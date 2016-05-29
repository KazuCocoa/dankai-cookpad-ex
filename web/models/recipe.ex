defmodule Dankai.Recipe do
  use Dankai.Web, :model

  alias Dankai.Repo
  alias Dankai.Recipe

  schema "recipes" do
    field :name, :string
    field :view_count, :integer, default: 0

    has_many :recipe_images, Dankai.RecipeImage
    #rails:  has_many :steps, -> { order("id") }
    has_many :steps, Dankai.Step

    timestamps
  end

  @required_fields ~w(name view_count)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def viewed!(id) do
    Repo.transaction(fn ->
      resipe = Repo.get!(Recipe, id)
      Repo.update!(%{resipe | view_count: resipe.view_count + 1})
    end)
  end
end
