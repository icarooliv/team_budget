defmodule TeamBudgetGraphQL.Types.User do
  @moduledoc """
  Types.User
  """
  use Absinthe.Schema.Notation

  object :user do
    field :id, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password_hash, :string
    field :role, :string
  end
end
