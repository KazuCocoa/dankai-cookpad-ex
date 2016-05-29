defmodule Dankai.Repo.Migrations.CreateRecipeImage do
  use Ecto.Migration

  def change do
    create table(:recipe_images) do
      add :recipe_id, :integer # MySQL向けだと必要かも , [size: 4]
      add :path, :string, [size: 255]
      add :digest, :string, [size: 255]

      timestamps
    end

  end
end
