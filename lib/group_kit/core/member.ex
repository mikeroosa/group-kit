defmodule GroupKit.Core.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :email_address, :string
    field :first_name, :string
    field :is_subscribed, :boolean, default: false
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:email_address, :first_name, :last_name, :is_subscribed])
    |> validate_required([:email_address, :first_name, :last_name, :is_subscribed])
  end
end
