defmodule ElxproBlogWeb.Plug.SetUser do
  import Plug.Conn

  alias ElxproBlog.Accounts.Core.AccountRepo
  def init(), do: nil

  def call(conn, _) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id and AccountRepo.get_user!(user_id) ->
        assign(conn, :user, user)

      true ->
        assign(conn, :user, nil)
    end
  end
end
