defmodule IdenticapiWeb.KernelControllerTest do
  use IdenticapiWeb.ConnCase

  alias Identicapi.Api
  alias Identicapi.Api.Kernel

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:kernel) do
    {:ok, kernel} = Api.create_kernel(@create_attrs)
    kernel
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all kernels", %{conn: conn} do
      conn = get conn, kernel_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create kernel" do
    test "renders kernel when data is valid", %{conn: conn} do
      conn = post conn, kernel_path(conn, :create), kernel: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, kernel_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, kernel_path(conn, :create), kernel: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update kernel" do
    setup [:create_kernel]

    test "renders kernel when data is valid", %{conn: conn, kernel: %Kernel{id: id} = kernel} do
      conn = put conn, kernel_path(conn, :update, kernel), kernel: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, kernel_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, kernel: kernel} do
      conn = put conn, kernel_path(conn, :update, kernel), kernel: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete kernel" do
    setup [:create_kernel]

    test "deletes chosen kernel", %{conn: conn, kernel: kernel} do
      conn = delete conn, kernel_path(conn, :delete, kernel)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, kernel_path(conn, :show, kernel)
      end
    end
  end

  defp create_kernel(_) do
    kernel = fixture(:kernel)
    {:ok, kernel: kernel}
  end
end
