defmodule ElxproBlogWeb.CommentsChannelTest do
  @moduledoc false
  use ElxproBlogWeb.ChannelCase

  alias ElxproBlog.Factory
  alias ElxproBlogWeb.CommentsChannel
  alias ElxproBlogWeb.UserSocket

  setup do
    posts = Enum.map(1..10, fn _ ->
      Factory.insert(:post)
    end)

    Enum.each(1..25, fn _ ->
      Factory.insert(:comment, %{post: Enum.random(posts)})
    end)

    random_post = Enum.random(posts)

    {:ok, _, socket} =
      UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(CommentsChannel, "comments:#{random_post.id}")

    %{socket: socket, post: random_post}
  end

  test "connects to socket", %{socket: socket, post: post} do
    assert "#{post.id}" == socket.assigns.post_id
  end

  test "ping replies with status ok", %{socket: socket} do
    content = "Shakespeare"
    ref = push(socket, "comment:add", content)
    assert_reply ref, :ok, _content

    assert_broadcast _broadcast_event, %{comment: %{content: "Shakespeare"}}
  end
end
