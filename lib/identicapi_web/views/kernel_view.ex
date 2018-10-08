defmodule IdenticapiWeb.KernelView do
  use IdenticapiWeb, :view
  alias IdenticapiWeb.KernelView

  def render("show.json", %{image: image}) do
    %{data: render_one(image, KernelView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{image: image}
  end
end
