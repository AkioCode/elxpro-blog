defmodule ElxproBlogWeb.CommentsChannel do
  @moduledoc false
  use ElxproBlogWeb, :channel

  alias ElxproBlog.Comments.Core.CommentRepo
  alias ElxproBlog.Posts.Core.PostRepo

  @impl true
  def join("comments:" <> post_id, payload, socket) do
    post = PostRepo.get_post_with_comments!(post_id)
    {:ok, %{comments: post.comments}, assign(socket, :post_id, post_id)}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (comments:lobby).
  @impl true
  def handle_in("comment:add", payload, socket) do
    response =
      socket.assigns.post_id
      |> CommentRepo.create_comment(%{content: payload})

    case response do
      {:ok, comment} ->
        broadcast!(socket, "comments:#{socket.assigns.post_id}:new", %{comment: comment})
        {:reply, :ok, socket}

      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}}
    end

    {:reply, :ok, socket}
  end
end
