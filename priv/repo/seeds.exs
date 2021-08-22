alias ElxproBlog.Repo

%{title: Faker.App.name(), description: Faker.Lorem.Shakespeare.hamlet()}
|> ElxproBlog.Posts.Data.Post.changeset()
|> Repo.insert!()

%{title: Faker.App.name(), description: Faker.Lorem.Shakespeare.hamlet()}
|> ElxproBlog.Posts.Data.Post.changeset()
|> Repo.insert!()
