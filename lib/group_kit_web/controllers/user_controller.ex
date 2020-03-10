defmodule GroupKitWeb.UserController do
    use GroupKitWeb, :controller

    alias GroupKit.Accounts

    def index(conn, _params) do
        users = Accounts.list_users()
        render(conn, "index.html", users: users)
    end
end