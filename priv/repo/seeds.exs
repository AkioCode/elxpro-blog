alias ElxproBlog.Repo
alias ElxproBlog.Posts.Data.Post
alias ElxproBlog.Comments.Data.Comment

p1 =
  Ecto.Changeset.change(%Post{}, %{
    title: Faker.App.name(),
    description: Faker.Lorem.Shakespeare.hamlet()
  })

c_p1 =
  Enum.map(1..5, fn _ ->
    Ecto.Changeset.change(%Comment{}, %{
      content: Faker.Lorem.sentence(1..20)
    })
  end)

Ecto.Changeset.put_assoc(p1, :comments, c_p1)
|> Repo.insert!()

%Post{}
|> Post.changeset(%{title: Faker.App.name(), description: Faker.Lorem.Shakespeare.hamlet()})
|> Repo.insert!()
