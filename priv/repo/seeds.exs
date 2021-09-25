alias ElxproBlog.Repo

%ElxproBlog.Posts.Data.Post{}
|> ElxproBlog.Posts.Data.Post.changeset(%{title: Faker.App.name(), description: Faker.Lorem.Shakespeare.hamlet()})
|> Repo.insert!()

%ElxproBlog.Posts.Data.Post{}
|> ElxproBlog.Posts.Data.Post.changeset(%{title: Faker.App.name(), description: Faker.Lorem.Shakespeare.hamlet()})
|> Repo.insert!()
