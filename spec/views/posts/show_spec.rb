require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  let!(:user) { User.create(name: 'John', bio: 'Dog lover', photo: 'john.jpg') }
  let!(:first_user) { User.first }
  let!(:users) { [first_user] }
  let!(:posts) { Post.all }
  first_user = User.create(name: 'Prantosh Biswas', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer')
  second_user = User.create(name: 'John Michael Doe', photo: 'https://media.gettyimages.com/id/1301087492/vector/semi-random-rainbow-colored-60-60-60-triangle-pattern.jpg?s=612x612&w=gi&k=20&c=pb_dh_VF6L5IgOk4rsbfqM7zIjTA4VA3NxZoiqpJMcs=', bio: 'Front-End Developer')
  first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id)
  second_post = Post.create(title: 'Third Post', text: 'This is my third post', author_id: first_user.id)
  third_post = Post.create(title: 'Fourth Post', text: 'This is my fourth post', author_id: first_user.id)
  first_comment = Comment.create(text: 'This is my first comment', user_id: first_user.id, post_id: first_post.id)
  like = Like.create(user_id: first_user.id, post_id: first_post.id)
  before do
    visit user_post_path(user, first_post)
  end
  describe 'Page content' do
    it "should display post's title" do
      expect(page).to have_content(first_post.title)
    end
    it "should display user's name" do
      expect(page).to have_content(first_user.name)
    end
    it 'should display post body' do
      expect(page).to have_content(first_post.text)
    end
    it 'should display the username of each commentor' do
      expect(page).to have_content(first_comment.user.name)
    end
    it 'should display the comments each commentor left' do
      expect(page).to have_content(first_comment.text)
    end
    it 'should display comment counts for each post' do
      expect(page).to have_content('Comments: 1')
    end
    it 'should display total likes for a post' do
      expect(page).to have_content('Likes: 1')
    end
  end
end
