defmodule TeamBudgetGraphQL.Resolvers.UserResolver do
  @moduledoc """
    UserResolver
  """

  def list_users(parent, params, resolutions) do
    IO.inspect(parent)
    {:ok, %{email: "user@email.com"}}
  end
end
