defmodule Dankai.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string, [size: 255]
      add :view_count, :integer, [default: 0] # MySQL向けだと必要かも , size: 4

      timestamps
    end
  end
end
