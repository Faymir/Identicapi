defmodule IdenticapiWeb.Router do
  use IdenticapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/json", IdenticapiWeb do
    pipe_through :api
    get("/:id/:width/:height", KernelController, :show)
    get("/:id", KernelController, :show)
  end

  scope "/image", IdenticapiWeb do
    pipe_through :api
    get "/:id/:width/:height", KernelController, :normal
    get "/:id", KernelController, :normal
  end
end
