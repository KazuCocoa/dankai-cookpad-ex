defmodule Dankai.Repo.Migrations.CreateStep do
  use Ecto.Migration

  def change do
    create table(:steps) do
      add :recipe_id, :integer # MySQL向けだと必要かも , [size: 4]
      add :description, :string, [size: 65535]

      timestamps
    end

  end
end
