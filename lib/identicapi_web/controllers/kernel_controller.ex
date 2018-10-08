defmodule IdenticapiWeb.KernelController do
  use IdenticapiWeb, :controller

  alias Identicapi.Api

  action_fallback IdenticapiWeb.FallbackController

  # def index(conn, _params) do
  #   kernels = Api.list_kernels()
  #   render(conn, "index.json", kernels: kernels)
  # end

  # def create(conn, %{"kernel" => kernel_params}) do
  #   with {:ok, %Kernel{} = kernel} <- Api.create_kernel(kernel_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", kernel_path(conn, :show, kernel))
  #     |> render("show.json", kernel: kernel)
  #   end
  # end

  def show(conn, %{"id" => id, "width" => width, "height" => height}) do
    # kernel = Api.get_kernel!(id)
    image =
    id
    |> Api.Identicon.main(width, height)
    |> Base.encode64

    conn
    |> put_resp_header("cache-control", "max-age=60")
    |> put_resp_header("connection", "close")

    render(conn, IdenticapiWeb.ImageView, "show.json", image: "data:image/png;base64," <> image)
  end

  def show(conn, %{"id" => id}) do
    show(conn, %{"id" => id, "width" => 250, "height" => 250})
  end

  # def update(conn, %{"id" => id, "kernel" => kernel_params}) do
  #   kernel = Api.get_kernel!(id)

  #   with {:ok, %Kernel{} = kernel} <- Api.update_kernel(kernel, kernel_params) do
  #     render(conn, "show.json", kernel: kernel)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   kernel = Api.get_kernel!(id)
  #   with {:ok, %Kernel{}} <- Api.delete_kernel(kernel) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
