defmodule MyCoolAppWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MyCoolApp.Repo

  alias MyCoolAppWeb.Resolvers

  @desc "One user"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :avatar_url, :string
  end

  object :account_queries do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      resolve(&Resolvers.AccountResolver.list_users/3)
    end
  end

  object :account_mutations do
    field :create_user, :user do
      arg(:name, non_null(:string))
      arg(:email, :string)

      resolve(&Resolvers.AccountResolver.create_user/3)
    end
  end

  object :account_subscriptions do
    field :user_created, :user do
      config(fn _, _ ->
        {:ok, topic: "users"}
      end)

      trigger(:create_user,
        topic: fn _ ->
          "users"
        end
      )
    end
  end
end
