defmodule MyCoolAppWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :my_cool_app
  use Absinthe.Phoenix.Endpoint

  socket "/socket", MyCoolAppWeb.AbsintheSocket,
    websocket: true,
    longpoll: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug CORSPlug

  plug MyCoolAppWeb.Router
end
