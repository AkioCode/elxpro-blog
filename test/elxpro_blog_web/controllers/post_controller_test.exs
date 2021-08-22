defmodule ElxproBlog.PostControllerTest do
  @moduledoc false
  use ElxproBlogWeb.ConnCase

  alias ElxproBlog.Factory

  describe "test post controller" do
    test "index", %{conn: conn} do
      response = get(conn, "/posts")
      assert html_response(response, 200) =~ "<h4>Todos posts</h4>"
    end

    test "show", %{conn: conn, post: post} do
      response = get(conn, "/posts/#{post.id}")
      assert html_response(response, 200) =~ "#{post.title}"
    end

    test "new", %{conn: conn} do
      response = get(conn, "/posts/new")
      assert html_response(response, 200) =~ "Criar post"
    end

    test "create", %{conn: conn} do
      post = Factory.params_for(:post)
      response = post(conn, "/posts", %{post: post})
      assert response.status == 302

      response = post(conn, "/posts", %{post: %{title: nil}})
      assert html_response(response, 200) =~ "Criar post"
    end

    test "edit", %{conn: conn, post: post} do
      response = get(conn, "/posts/#{post.id}/edit")
      assert html_response(response, 200) =~ "Editar post"
    end

    test "update", %{conn: conn} do
      post = Factory.insert(:post)
      title = Faker.Person.title()
      to_update = %{"post" => %{"title" => title}}

      response = put(conn, "/posts/#{post.id}", to_update)
      assert response.status == 302

      response = post(conn, "/posts", %{id: post.id, post: %{title: nil}})
      assert html_response(response, 200) =~ "Criar post"
    end

    test "delete", %{conn: conn} do
      post = Factory.insert(:post)

      response = delete(conn, "/posts/#{post.id}")
      assert response.status == 302
    end
  end
end
