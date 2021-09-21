defmodule ElxproBlog.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: ElxproBlog.Repo
  alias ElxproBlog.Comments.Data.Comment
  alias ElxproBlog.Posts.Data.Post

  def post_factory do
    %Post{
      title: Faker.Person.title(),
      description: Faker.Lorem.sentence(10..20)
    }
  end

  def comment_factory do
    %Comment{
      content: Faker.Lorem.sentence(10..30),
      post: build(:post)
    }
  end
end
