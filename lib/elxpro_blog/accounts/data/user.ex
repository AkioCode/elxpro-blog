defmodule ElxproBlog.Accounts.Data.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @fields [
    :first_name,
    :last_name,
    :image,
    :provider,
    :email,
    :token
  ]

  @required_fields [
    :provider,
    :email,
    :token
  ]

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :image, :string
    field :last_name, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
  end
end
