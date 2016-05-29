defmodule Dankai.StepTest do
  use Dankai.ModelCase

  alias Dankai.Step

  @valid_attrs %{description: "some content", recipe_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Step.changeset(%Step{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Step.changeset(%Step{}, @invalid_attrs)
    refute changeset.valid?
  end
end
