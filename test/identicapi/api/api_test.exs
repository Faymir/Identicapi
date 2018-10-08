defmodule Identicapi.ApiTest do
  use Identicapi.DataCase

  alias Identicapi.Api

  describe "kernels" do
    alias Identicapi.Api.Kernel

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def kernel_fixture(attrs \\ %{}) do
      {:ok, kernel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_kernel()

      kernel
    end

    test "list_kernels/0 returns all kernels" do
      kernel = kernel_fixture()
      assert Api.list_kernels() == [kernel]
    end

    test "get_kernel!/1 returns the kernel with given id" do
      kernel = kernel_fixture()
      assert Api.get_kernel!(kernel.id) == kernel
    end

    test "create_kernel/1 with valid data creates a kernel" do
      assert {:ok, %Kernel{} = kernel} = Api.create_kernel(@valid_attrs)
    end

    test "create_kernel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_kernel(@invalid_attrs)
    end

    test "update_kernel/2 with valid data updates the kernel" do
      kernel = kernel_fixture()
      assert {:ok, kernel} = Api.update_kernel(kernel, @update_attrs)
      assert %Kernel{} = kernel
    end

    test "update_kernel/2 with invalid data returns error changeset" do
      kernel = kernel_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_kernel(kernel, @invalid_attrs)
      assert kernel == Api.get_kernel!(kernel.id)
    end

    test "delete_kernel/1 deletes the kernel" do
      kernel = kernel_fixture()
      assert {:ok, %Kernel{}} = Api.delete_kernel(kernel)
      assert_raise Ecto.NoResultsError, fn -> Api.get_kernel!(kernel.id) end
    end

    test "change_kernel/1 returns a kernel changeset" do
      kernel = kernel_fixture()
      assert %Ecto.Changeset{} = Api.change_kernel(kernel)
    end
  end

  describe "kernels" do
    alias Identicapi.Api.Kernel

    @valid_attrs %{content: "some content", name: "some name"}
    @update_attrs %{content: "some updated content", name: "some updated name"}
    @invalid_attrs %{content: nil, name: nil}

    def kernel_fixture(attrs \\ %{}) do
      {:ok, kernel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_kernel()

      kernel
    end

    test "list_kernels/0 returns all kernels" do
      kernel = kernel_fixture()
      assert Api.list_kernels() == [kernel]
    end

    test "get_kernel!/1 returns the kernel with given id" do
      kernel = kernel_fixture()
      assert Api.get_kernel!(kernel.id) == kernel
    end

    test "create_kernel/1 with valid data creates a kernel" do
      assert {:ok, %Kernel{} = kernel} = Api.create_kernel(@valid_attrs)
      assert kernel.content == "some content"
      assert kernel.name == "some name"
    end

    test "create_kernel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_kernel(@invalid_attrs)
    end

    test "update_kernel/2 with valid data updates the kernel" do
      kernel = kernel_fixture()
      assert {:ok, kernel} = Api.update_kernel(kernel, @update_attrs)
      assert %Kernel{} = kernel
      assert kernel.content == "some updated content"
      assert kernel.name == "some updated name"
    end

    test "update_kernel/2 with invalid data returns error changeset" do
      kernel = kernel_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_kernel(kernel, @invalid_attrs)
      assert kernel == Api.get_kernel!(kernel.id)
    end

    test "delete_kernel/1 deletes the kernel" do
      kernel = kernel_fixture()
      assert {:ok, %Kernel{}} = Api.delete_kernel(kernel)
      assert_raise Ecto.NoResultsError, fn -> Api.get_kernel!(kernel.id) end
    end

    test "change_kernel/1 returns a kernel changeset" do
      kernel = kernel_fixture()
      assert %Ecto.Changeset{} = Api.change_kernel(kernel)
    end
  end
end
