defmodule TeamBudgetGraphQL.Resolvers.UserResolver do
  @moduledoc """
    UserResolver
  """
  alias TeamBudget.Accounts

  def list_users(parent, params, resolutions) do
    {:ok, Accounts.list_users()}
  end

  def create_user(_, %{user: user}, _) do
    Accounts.create_user(user)
  end
end
