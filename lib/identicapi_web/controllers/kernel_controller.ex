defmodule IdenticapiWeb.KernelController do
  use IdenticapiWeb, :controller

  alias Identicapi.Api

  action_fallback IdenticapiWeb.FallbackController

  def create(conn, %{"id" => id, "width" => width, "height" => height}) do
    image = genImage(id, width, height)
    render(conn, IdenticapiWeb.ImageView, "show.json", image: image)
  end

  def create(conn, %{"id" => id}) do
    create(conn, %{"id" => id, "width" => 250, "height" => 250})
  end

  @doc """
    This function is responsible of sending back to user a valid html5 image directly usable from img tag

    eg: <img src="http://thisapiurl.com/image/{username}"> and directly see your image showing
  """
  def show(conn, %{"id" => id, "width" => width, "height" => height}) do
    image = Api.Identicon.main(id,width, height)

    conn
    |> put_resp_header("content-type", "image/png")
    |> Plug.Conn.send_resp(200, image)
  end

  def show(conn, %{"id" => id}) do
    show(conn, %{"id" => id, "width" => 250, "height" => 250})
  end

  defp genImage(id, width, height) do
    image =
    id
    |> Api.Identicon.main(width, height)
    |> Base.encode64
    "data:image/png;base64," <> image
  end
end
