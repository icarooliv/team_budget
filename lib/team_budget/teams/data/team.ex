defmodule TeamBudget.Teams.Data.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias TeamBudget.Accounts.Data.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :description, :string
    field :name, :string
    field :slug, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(atrrs \\ %{}) do
    changeset(%__MODULE__{}, atrrs)
  end

  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :slug, :description, :user_id])
    |> create_slug(:name, :slug)
    |> validate_required([:name, :slug, :description])
    |> unique_constraint(:slug)
  end

  defp create_slug(%Ecto.Changeset{changes: changes} = changeset, slug_origin, slug_destiny) do
    slug = changes
    |> Map.get(slug_origin)
    |> Slug.slugify()
    changes = Map.put(changes, slug_destiny, slug)
    %Ecto.Changeset{changeset | changes: changes}
  end
end
