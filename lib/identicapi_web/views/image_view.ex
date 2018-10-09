defmodule IdenticapiWeb.ImageView do
  use IdenticapiWeb, :view
  alias IdenticapiWeb.ImageView

  def render("show.json", %{image: image}) do
    %{data: render_one(image, ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{image: image}
  end

  def render("normal.json", %{image: image}) do
    image
  end
end
