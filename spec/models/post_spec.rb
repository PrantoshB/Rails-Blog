require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    first_user = User.create(name: 'Prantosh', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer', posts_counter: 1)
    first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id, comments_counter: 0, likes_counter: 0)

    it 'is not valid without a title' do
      first_post.title = nil
      expect(first_post).to_not be_valid
    end

    it 'is not valid if the title is more than 250 characters' do
      first_post = Post.create(
        title: 'This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very looooooooooooooooooooooooooooooooong title', text: 'This is my first post', author_id: first_user.id, likes_counter: 'one'
      )
      expect(first_post).to_not be_valid
    end

    it 'likes_counter should be greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be an integer' do
      subject.likes_counter = 1.5
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be an integer' do
      subject.comments_counter = 1.5
      expect(subject).to_not be_valid
    end
  end
end
