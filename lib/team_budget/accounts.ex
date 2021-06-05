defmodule TeamBudget.Accounts do
  @moduledoc false
  alias TeamBudget.Accounts.Core.UserRepo

  def list_users() do
    UserRepo.list_users()
  end

  def create_user(user) do
    UserRepo.create_user(user)
  end

  def get_user(params) do
    UserRepo.get_user(params)
  end
end
