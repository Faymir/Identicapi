defmodule Identicapi.Api.Kernel do
  use Ecto.Schema
  import Ecto.Changeset


  schema "kernels" do
    field :content, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(kernel, attrs) do
    kernel
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
    |> unique_constraint(:name)
  end
end
