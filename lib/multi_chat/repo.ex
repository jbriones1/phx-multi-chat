defmodule MultiChat.Repo do
  use Ecto.Repo,
    otp_app: :multi_chat,
    adapter: Ecto.Adapters.Postgres
end
