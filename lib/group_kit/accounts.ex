defmodule GroupKit.Accounts do
    @moduledoc """
    The Accounts context.
    """

    alias GroupKit.Accounts.User

    def list_users do
        [
            %User{id: "1", name: "Mike Roosa", username: "mikeroosa"},
            %User{id: "2", name: "Dylan Jones", username: "dylanjones"},
            %User{id: "3", name: "Larry Leesker", username: "larry2121"}
        ]
    end

    def get_user(id) do
        Enum.find(list_users(), fn map -> map.id == id end)
    end

    def get_user_by(params) do
        Enum.find(list_users(), fn map -> Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end) end)
    end
end