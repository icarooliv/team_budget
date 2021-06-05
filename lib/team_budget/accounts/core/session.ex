defmodule TeamBudget.Accounts.Core.Session do
  @moduledoc false
  alias TeamBudget.Accounts.Core.{Guardian, UserRepo}

  def login(user) do
    with found <- UserRepo.get_user(%{email: user.email}),
         {:ok, verified_user} <- verify_password(found, user.password),
         {:ok, token, _} <- sign_user(verified_user) do
      {:ok, %{token: token, user: verified_user}}
    else
      {:error, _} -> {:error, "Email or password invalid"}
    end
  end

  defp verify_password(nil, _), do: {:error, :not_found}

  defp verify_password(user, password) do
    if Argon2.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :unauthorized}
    end
  end

  defp sign_user(user) do
    Guardian.sign(user)
  end
end
