defmodule TeamBudget.Accounts.Core.UserRepo do
  @doc false
  alias TeamBudget.Accounts.Data.User
  alias TeamBudget.Repo

  def list_users() do
    Repo.all(User)
  end

  def create_user(user) do
    user
    |> User.changeset()
    |> Repo.insert()
  end

  def get_user(%{id: id}), do: Repo.get(User, id)
  def get_user(%{email: email}), do: Repo.get_by(User, email: email)
end
