defmodule Identicapi.Api do
  @moduledoc """
  The Api context.
  """

  # import Ecto.Query, warn: false
  # alias Identicapi.Repo
  # alias Identicapi.Api.Kernel

  # @doc """
  # Returns the list of kernels.

  # ## Examples

  #     iex> list_kernels()
  #     [%Kernel{}, ...]

  # """
  # def list_kernels do
  #   Repo.all(Kernel)
  # end

  # @doc """
  # Gets a single kernel.

  # Raises `Ecto.NoResultsError` if the Kernel does not exist.

  # ## Examples

  #     iex> get_kernel!(123)
  #     %Kernel{}

  #     iex> get_kernel!(456)
  #     ** (Ecto.NoResultsError)

  # """
  # def get_kernel!(id), do: Repo.get!(Kernel, id)

  # @doc """
  # Creates a kernel.

  # ## Examples

  #     iex> create_kernel(%{field: value})
  #     {:ok, %Kernel{}}

  #     iex> create_kernel(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def create_kernel(attrs \\ %{}) do
  #   %Kernel{}
  #   |> Kernel.changeset(attrs)
  #   |> Repo.insert()
  # end

  # @doc """
  # Updates a kernel.

  # ## Examples

  #     iex> update_kernel(kernel, %{field: new_value})
  #     {:ok, %Kernel{}}

  #     iex> update_kernel(kernel, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_kernel(%Kernel{} = kernel, attrs) do
  #   kernel
  #   |> Kernel.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a Kernel.

  # ## Examples

  #     iex> delete_kernel(kernel)
  #     {:ok, %Kernel{}}

  #     iex> delete_kernel(kernel)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_kernel(%Kernel{} = kernel) do
  #   Repo.delete(kernel)
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking kernel changes.

  # ## Examples

  #     iex> change_kernel(kernel)
  #     %Ecto.Changeset{source: %Kernel{}}

  # """
  # def change_kernel(%Kernel{} = kernel) do
  #   Kernel.changeset(kernel, %{})
  # end
end
