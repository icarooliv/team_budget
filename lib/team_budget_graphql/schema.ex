defmodule TeamBudgetGraphQL.Schema do
  @moduledoc """
    Schema
  """
  use Absinthe.Schema
  alias TeamBudgetGraphQL.Resolvers

  import_types(TeamBudgetGraphQL.Types)

  import AbsintheErrorPayload.Payload
  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  payload_object(:user_payload, :user)

  query do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      resolve(&Resolvers.UserResolver.list_users/3)
    end
  end

  mutation do
    @desc "Create a new user"
    field :create_user, :user_payload do
      arg(:user, non_null(:user_input))
      resolve(&Resolvers.UserResolver.create_user/3)
      middleware(&build_payload/2)
    end
  end
end
