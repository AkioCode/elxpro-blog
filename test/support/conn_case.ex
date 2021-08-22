defmodule ElxproBlogWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use ElxproBlogWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import ElxproBlogWeb.ConnCase

      alias ElxproBlogWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint ElxproBlogWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(ElxproBlog.Repo)
    post = ElxproBlog.Factory.insert(:post)

    unless tags[:async] do
      Sandbox.mode(ElxproBlog.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn(), post: post}
  end

  def get_resp_body(conn), do: conn |> Map.get(:resp_body) |> Jason.decode!()

  def get_resp_message(conn) do
    case conn |> get_resp_body() do
      %{"message" => message} -> message
      body -> raise "Field \"message\" not found in #{inspect(body)}"
    end
  end

  def get_resp_data(conn) do
    case conn |> get_resp_body() do
      %{"data" => data} -> data
      body -> raise "Field \"data\" not found in #{inspect(body)}"
    end
  end

  def get_resp_details(conn) do
    case conn |> get_resp_body() do
      %{"details" => details} -> details
      body -> raise "Field \"details\" not found in #{inspect(body)}"
    end
  end
end
