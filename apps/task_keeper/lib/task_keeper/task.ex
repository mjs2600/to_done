defmodule TaskKeeper.Task do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "tasks" do
    field :name
    field :completed, :boolean
    field :archived, :boolean
  end

  def changeset(task, params \\ %{}) do
    task
    |> cast(params, [:name, :completed, :archived])
    |> validate_required([:name])
  end

  def active do
    from t in __MODULE__,
      where: not t.archived
  end
end
