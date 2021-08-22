defmodule ElxproBlog.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: ElxproBlog.Repo
  alias ElxproBlog.Posts.Data.Post

  def post_factory do
    %Post{
      title: Faker.Person.title(),
      description: Faker.Lorem.sentence(10..20)
    }
  end
end
