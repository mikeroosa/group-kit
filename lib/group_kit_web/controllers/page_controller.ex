defmodule GroupKitWeb.PageController do
  use GroupKitWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
