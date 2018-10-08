defmodule IdenticapiWeb.Router do
  use IdenticapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/identicapi", IdenticapiWeb do
    pipe_through :api
    get("/:id/:width/:height", KernelController, :show)
    get("/:id", KernelController, :show)
  end
end
