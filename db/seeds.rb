first_user = User.create(name: 'Prantosh Biswas', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer')

second_user = User.create(name: 'John Michael Doe', photo: 'https://media.gettyimages.com/id/1301087492/vector/semi-random-rainbow-colored-60-60-60-triangle-pattern.jpg?s=612x612&w=gi&k=20&c=pb_dh_VF6L5IgOk4rsbfqM7zIjTA4VA3NxZoiqpJMcs=', bio: 'Front-End Developer')

first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id)

second_post = Post.create(title: 'Second Post', text: 'This is my second post and here I am going to add a long text, so that I can understand howw much space it is taking on the screen. This is a very long text', author_id: first_user.id)

third_post = Post.create(title: 'Third Post', text: 'This is my third post', author_id: second_user.id)

fourth_post = Post.create(title: 'Fourth Post', text: 'This is my fourth post', author_id: first_user.id)

first_comment = Comment.create(text: 'This is my first comment', user_id: first_user.id, post_id: first_post.id)

second_comment = Comment.create(text: 'This is my first comment', user_id: first_user.id, post_id: second_post.id)

third_comment = Comment.create(text: 'Helpful Post', user_id: first_user.id, post_id: second_post.id)

like = Like.create( user_id: first_user.id, post_id: second_post.id)
