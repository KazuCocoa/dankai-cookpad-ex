defmodule Dankai.Pv do
  use Dankai.Web, :model

  schema "pvs" do
    field :controller, :string
    field :action, :string

    timestamps
  end

  @required_fields ~w(controller action)
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
end
