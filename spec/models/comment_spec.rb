require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    first_user = User.create(name: 'Prantosh', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer', posts_counter: 0)
    first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id, comments_counter: 0, likes_counter: 0)
    first_comment = Comment.create(text: 'This is my first comment', user_id: first_user.id, post_id: first_post.id)

    first_comment.save

    it 'is not valid without a text' do
      first_comment.text = 'This is a comment'
      expect(first_comment).to be_valid
    end

    it 'posts comments count should be 0' do
      expect(first_post.comments_counter).to eq 0
    end
  end
end
