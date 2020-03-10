defmodule GroupKitWeb.SessionController do
  use GroupKitWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case GroupKit.Accounts.authenticate_by_username_and_password(username, password) do
      {:ok, user} ->
        conn
        |> GroupKitWeb.Auth.login(user)
        |> put_flash(:info, "Welcome Back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username or password.")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> GroupKitWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
