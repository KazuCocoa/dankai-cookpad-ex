defmodule Dankai.RecipeImage do
  use Dankai.Web, :model

  schema "recipe_images" do
    field :path, :string
    field :digest, :string

    belongs_to :recipe, Dankai.Recipe

    timestamps
  end

  @required_fields ~w(recipe_id path digest)
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

  def path(id), do: "/uploads/recipe_images/#{id}.jpg"

  def upload_to(id), do: "public#{path(id)}"

  def raw(id), do: File.read! Dankai.Endpoint.config(:root), upload_to(id)

  # TODO recipe_image_form.rb の実装はまだ
end
