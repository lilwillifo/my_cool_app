defmodule MyCoolAppWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(MyCoolAppWeb.Schema.AccountTypes)

  query do
    import_fields(:account_queries)
  end

  mutation do
    import_fields(:account_mutations)
  end

  subscription do
    import_fields(:account_subscriptions)
  end
end
