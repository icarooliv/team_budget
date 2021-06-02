# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TeamBudget.Repo.insert!(%TeamBudget.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TeamBudget.{Accounts.User, Repo}

%{first_name: "Icaro", last_name: "Oliveira", email: "icaro@email.com", password_hash: "123123"}
|> User.changeset()
|> IO.inspect()
|> Repo.insert()

%{first_name: "Icaro2", last_name: "Oliveira", email: "icaro2@email.com", password_hash: "123123"}
|> User.changeset()
|> Repo.insert()
