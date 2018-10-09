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
    image = genImage(id, width, height)
    render(conn, IdenticapiWeb.ImageView, "show.json", image: image)
  end

  def show(conn, %{"id" => id}) do
    show(conn, %{"id" => id, "width" => 250, "height" => 250})
  end

  @doc """
    This function is responsible of sending back to user a valid html5 image directly usable from img tag

    eg: <img src="http://thisapiurl.com/image/{username}"> and directly see your image showing
  """
  def normal(conn, %{"id" => id, "width" => width, "height" => height}) do
    image = Api.Identicon.main(id,width, height)

    conn
    |> put_resp_header("content-type", "image/png")
    |> Plug.Conn.send_resp(200, image)
  end

  def normal(conn, %{"id" => id}) do
    normal(conn, %{"id" => id, "width" => 250, "height" => 250})
  end

  defp genImage(id, width, height) do
    image =
    id
    |> Api.Identicon.main(width, height)
    |> Base.encode64
    "data:image/png;base64," <> image
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
