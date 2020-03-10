defmodule GroupKit.CoreTest do
  use GroupKit.DataCase

  alias GroupKit.Core

  describe "members" do
    alias GroupKit.Core.Member

    @valid_attrs %{email_address: "some email_address", first_name: "some first_name", is_subscribed: true, last_name: "some last_name"}
    @update_attrs %{email_address: "some updated email_address", first_name: "some updated first_name", is_subscribed: false, last_name: "some updated last_name"}
    @invalid_attrs %{email_address: nil, first_name: nil, is_subscribed: nil, last_name: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Core.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Core.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Core.create_member(@valid_attrs)
      assert member.email_address == "some email_address"
      assert member.first_name == "some first_name"
      assert member.is_subscribed == true
      assert member.last_name == "some last_name"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Core.update_member(member, @update_attrs)
      assert member.email_address == "some updated email_address"
      assert member.first_name == "some updated first_name"
      assert member.is_subscribed == false
      assert member.last_name == "some updated last_name"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_member(member, @invalid_attrs)
      assert member == Core.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Core.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Core.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Core.change_member(member)
    end
  end
end
