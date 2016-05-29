defmodule Dankai.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string, size: 255
      add :view_count, :integer, size: 4, default: 0

      timestamps
    end
  end
end
