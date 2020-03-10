defmodule GroupKit.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :email_address, :string
      add :first_name, :string
      add :last_name, :string
      add :is_subscribed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
