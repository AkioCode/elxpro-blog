defmodule ElxproBlog.CommentsTest do
  use ElxproBlog.DataCase

  alias ElxproBlog.Comments.Core.CommentRepo
  alias ElxproBlog.Factory

  describe "comments" do
    alias ElxproBlog.Comments.Data.Comment

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    test "list_comments/0 returns all comments" do
      comment = Factory.insert(:comment)
      comment_inserted = Repo.get!(Comment, comment.id)
      assert CommentRepo.list_comments() == [comment_inserted]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = Factory.insert(:comment)
      comment_inserted = Repo.get!(Comment, comment.id) |> Repo.preload(:post)
      assert comment == comment_inserted
    end

    test "create_comment/1 with valid data creates a comment" do
      post = Factory.insert(:post)
      assert {:ok, %Comment{} = comment} = CommentRepo.create_comment(post.id, @valid_attrs)
      assert comment.content == "some content"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      post = Factory.insert(:post)
      assert {:error, %Ecto.Changeset{}} = CommentRepo.create_comment(post.id, @invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = Factory.insert(:comment)
      assert {:ok, %Comment{} = comment} = CommentRepo.update_comment(comment, @update_attrs)
      assert comment.content == "some updated content"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = Factory.insert(:comment)
      assert {:error, %Ecto.Changeset{}} = CommentRepo.update_comment(comment, @invalid_attrs)
      comment_inserted = Repo.get!(Comment, comment.id) |> Repo.preload(:post)
      assert comment == comment_inserted
    end

    test "delete_comment/1 deletes the comment" do
      comment = Factory.insert(:comment)
      assert {:ok, %Comment{}} = CommentRepo.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> CommentRepo.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = Factory.insert(:comment)
      assert %Ecto.Changeset{} = CommentRepo.change_comment(comment)
    end
  end
end
