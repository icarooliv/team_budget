defmodule TeamBudget.Accounts.Data.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias TeamBudget.Teams.Data.Team

  @fields ~w[email first_name last_name role password password_confirmation]a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :role, :string, default: "user"

    has_many :teams, Team

    timestamps()
  end

  def changeset(attrs \\ %{}) do
    changeset(%__MODULE__{}, attrs)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase/1)
    |> validate_length(:password, min: 6, max: 100)
    |> validate_confirmation(:password)
    |> hash_password()
    |> cast_assoc(:teams, with: &Team.changeset/2)
  end

  def hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  def hash_password(changeset), do: changeset
end
