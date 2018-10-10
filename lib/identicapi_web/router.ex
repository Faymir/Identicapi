defmodule IdenticapiWeb.Router do
  use IdenticapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  #for responses like {data: {image: "data:image/png..."}}
  scope "/json", IdenticapiWeb do
    pipe_through :api
    get("/:id/:width/:height", KernelController, :create)
    get("/:id", KernelController, :create)
  end

  scope "/img", IdenticapiWeb do
    pipe_through :api
    get "/:id/:width/:height", KernelController, :show
    get "/:id", KernelController, :show
  end
end
