defmodule ElxproBlog.Repo do
  use Ecto.Repo,
    otp_app: :elxpro_blog,
    adapter: Ecto.Adapters.Postgres
end
