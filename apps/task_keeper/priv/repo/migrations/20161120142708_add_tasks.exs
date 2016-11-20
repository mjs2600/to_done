defmodule TaskKeeper.Repo.Migrations.AddTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string, null: false
      add :completed, :boolean, null: false, default: false
      add :archived, :boolean, null: false, default: false
    end

  end
end
