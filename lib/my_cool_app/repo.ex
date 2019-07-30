defmodule MyCoolApp.Repo do
  use Ecto.Repo,
    otp_app: :my_cool_app,
    adapter: Ecto.Adapters.Postgres
end
