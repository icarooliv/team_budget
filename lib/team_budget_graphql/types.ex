defmodule TeamBudgetGraphQL.Types do
  @moduledoc """
    Types
  """
  use Absinthe.Schema.Notation
  alias TeamBudgetGraphQL.Types

  import_types(Types.User)
  import_types(Types.Session)
  import_types(Types.Team)
end
