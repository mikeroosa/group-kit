defmodule GroupKit.Repo do
  use Ecto.Repo,
    otp_app: :group_kit,
    adapter: Ecto.Adapters.Postgres
end
