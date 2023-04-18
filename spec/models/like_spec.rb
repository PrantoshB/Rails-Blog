require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations' do
    first_user = User.create(name: 'Prantosh', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer', posts_counter: 0)
    first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id, comments_counter: 0, likes_counter: 0)
    first_like = Like.create(user_id: first_user.id, post_id: first_post.id)

    it 'is not valid without a users_id' do
      first_like.user_id = nil
      expect(first_like).to_not be_valid
    end

    it 'is not valid without a posts_id' do
      first_like.post_id = nil
      expect(first_like).to_not be_valid
    end

    it 'posts likes count should be 0' do
      expect(first_post.likes_counter).to eq 0
    end
  end
end
