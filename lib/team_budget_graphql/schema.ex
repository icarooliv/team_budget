defmodule TeamBudgetGraphQL.Schema do
  @moduledoc """
    Schema
  """
  use Absinthe.Schema
  alias TeamBudgetGraphQL.Resolvers
  alias TeamBudgetGraphQL.Middlewares

  import_types(TeamBudgetGraphQL.Types)

  import AbsintheErrorPayload.Payload
  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  payload_object(:user_payload, :user)
  payload_object(:login_payload, :session)

  query do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      middleware(Middlewares.Authorize, :user)
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

    @desc "Login a user"
    field :login, :login_payload do
      arg(:user, non_null(:login_input))
      resolve(&Resolvers.SessionResolver.login/3)
      middleware(&build_payload/2)
    end
  end
end
