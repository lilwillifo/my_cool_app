defmodule MyCoolAppWeb.Router do
  use MyCoolAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MyCoolAppWeb.Schema

    forward "/", Absinthe.Plug, schema: MyCoolAppWeb.Schema
  end
end
