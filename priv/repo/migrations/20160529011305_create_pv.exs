defmodule Dankai.Repo.Migrations.CreatePv do
  use Ecto.Migration

  def change do
    create table(:pvs) do
      add :controller, :string, size: 255
      add :action, :string, size: 255

      timestamps
    end

  end
end
