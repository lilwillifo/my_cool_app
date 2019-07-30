defmodule MyCoolAppWeb.PageController do
  use MyCoolAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
