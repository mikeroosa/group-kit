defmodule GroupKitWeb.UserView do
    use GroupKitWeb, :view

    alias GroupKit.Accounts

    def first_name(%Accounts.User{name: name}) do
        name
        |> String.split(" ")
        |> Enum.at(0)
    end
end