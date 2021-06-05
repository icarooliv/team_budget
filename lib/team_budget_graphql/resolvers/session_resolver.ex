defmodule TeamBudgetGraphQL.Resolvers.SessionResolver do
  @moduledoc """
    SessionResolver
  """
  alias TeamBudget.Session

  def login(_parent, %{user: user}, _resolutions) do
    Session.login(user)
  end
end
