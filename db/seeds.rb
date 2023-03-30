# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Prantosh', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer')
second_user = User.create(name: 'Biswas', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Front-End Developer')

first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id)
second_post = Post.create(title: 'Second Post', text: 'This is my second post', author_id: second_user.id)
third_post = Post.create(title: 'Third Post', text: 'This is my third post', author_id: second_user.id)
fourth_post = Post.create(title: 'Fourth Post', text: 'This is my fourth post', author_id: first_user.id)

first_comment = Comment.create(text: 'This is my first comment', users_id: first_user.id, posts_id: first_post.id)
second_comment = Comment.create(text: 'This is my second comment', users_id: first_user.id, posts_id: second_post.id)
third_comment = Comment.create(text: 'This is my third comment', users_id: first_user.id, posts_id: fourth_post.id)
fourth_comment = Comment.create(text: 'This is my fourth comment', users_id: first_user.id, posts_id: first_post.id)
fifth_comment = Comment.create(text: 'This is my fifth comment', users_id: first_user.id, posts_id: third_post.id)
sixth_comment = Comment.create(text: 'This is my sixth comment', users_id: first_user.id, posts_id: second_post.id)
