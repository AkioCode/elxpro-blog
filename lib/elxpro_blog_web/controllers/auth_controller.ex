defmodule ElxproBlogWeb.AuthController do
  use ElxproBlogWeb, :controller
  plug Ueberauth

  alias ElxproBlog.Accounts.Core.AccountRepo

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider}) do
    user = %{
      token: auth.credentials.token,
      email: auth.info.email,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      image: auth.info.image,
      provider: provider
    }

    case AccountRepo.create_user(user) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Bem-vind@, #{user.email}!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, error} ->
        conn
        |> put_flash(:error, error)
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
