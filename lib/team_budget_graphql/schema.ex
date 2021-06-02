defmodule TeamBudgetGraphQL.Schema do
  @moduledoc """
    Schema
  """
  use Absinthe.Schema
  alias TeamBudgetGraphQL.Resolvers

  import_types(TeamBudgetGraphQL.Types)

  query do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      resolve(&Resolvers.UserResolver.list_users/3)
    end
  end
end
