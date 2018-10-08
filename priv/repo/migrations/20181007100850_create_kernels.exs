defmodule Identicapi.Repo.Migrations.CreateKernels do
  use Ecto.Migration

  def change do
    create table(:kernels) do
      add :name, :string
      add :content, :text

      timestamps()
    end

    create unique_index(:kernels, [:name])
  end
end
