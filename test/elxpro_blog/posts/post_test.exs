defmodule ElxproBlog.PostTest do
  @moduledoc false
  use ElxproBlog.DataCase

  alias ElxproBlog.Factory
  alias ElxproBlog.Posts.Core.PostRepo

  describe "test post repo"do
    test "all" do
      assert length(PostRepo.all()) == 1
    end

    test "get!", %{post: post} do
      query_post = PostRepo.get!(post.id)
      assert post == query_post
    end

    test "insert" do
      params = Factory.params_for(:post)
      {:ok, post} = PostRepo.insert(params)
      assert post.title == params.title
      assert post.description == params.description
    end

    test "update" do
      post = Factory.insert(:post)
      title = Faker.Person.title
      to_update = %{
        "id" => post.id,
        "post" => %{
          "title" => title}}

      assert {:ok, updated_post} = PostRepo.update(to_update)
      assert updated_post.title == title
    end

    test "delete" do
      post = Factory.insert(:post)
      assert {:ok, _} = PostRepo.delete(post.id)
    end
  end
end
