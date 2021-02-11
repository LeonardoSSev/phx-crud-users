defmodule PhxCrudUsers.Repo do
  use Ecto.Repo,
    otp_app: :phx_crud_users,
    adapter: Ecto.Adapters.Postgres
end
