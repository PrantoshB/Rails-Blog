require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  let!(:first_user) { User.first }
  let!(:second_user) { User.second }
  let!(:users) { [first_user] }
  let!(:posts) { Post.all }

  before(:example) do
    first_user = User.create(name: 'Prantosh Biswas', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer')

    second_user = User.create(name: 'John Michael Doe', photo: 'https://media.gettyimages.com/id/1301087492/vector/semi-random-rainbow-colored-60-60-60-triangle-pattern.jpg?s=612x612&w=gi&k=20&c=pb_dh_VF6L5IgOk4rsbfqM7zIjTA4VA3NxZoiqpJMcs=', bio: 'Front-End Developer')
    first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id)

    first_comment = Comment.create(text: 'This is my first comment', user_id: first_user.id, post_id: first_post.id)

    like = Like.create(user_id: first_user.id, post_id: first_post.id)
    visit users_path
  end
  describe 'GET /users' do
    it 'I can see the username of all other users' do
      expect(page).to have_content('Prantosh Biswas')
    end

    it 'I can see the profile picture for all other users' do
      expect(page).to have_css('img')
    end

    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('1')
    end

    context 'when I click on a user' do
      it 'username of all users' do
        users.each do |user|
          visit "/users/#{user.id}"
          expect(page).to have_text(user.name)
        end
      end

      it 'can see the user profile picture' do
        users.each do |user|
          visit "/users/#{user.id}"
          expect(page).to have_selector("img[src='#{user.photo}']")
        end
      end
    end
  end
end
