require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
    let!(:first_user) { User.first}
    let!(:users) { [first_user ] }
    let!(:posts) { Post.all }

    first_user = User.create(name: 'Prantosh Biswas', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer')

    second_user = User.create(name: 'John Michael Doe', photo: 'https://media.gettyimages.com/id/1301087492/vector/semi-random-rainbow-colored-60-60-60-triangle-pattern.jpg?s=612x612&w=gi&k=20&c=pb_dh_VF6L5IgOk4rsbfqM7zIjTA4VA3NxZoiqpJMcs=', bio: 'Front-End Developer')
    first_post = Post.create(title: 'First Post', text: 'This is my first post', author_id: first_user.id)
    second_post = Post.create(title: 'Third Post', text: 'This is my third post', author_id: first_user.id)

    third_post = Post.create(title: 'Fourth Post', text: 'This is my fourth post', author_id: first_user.id)

    first_comment = Comment.create(text: 'This is my first comment', user_id: first_user.id, post_id: first_post.id)

    like = Like.create( user_id: first_user.id, post_id: first_post.id)

  before do
    visit user_posts_path(first_user.id)
  end

  describe 'Page content' do
    it "should display user's profile picture" do
      expect(page).to have_css("img[src='#{first_user.photo}']")
    end

    it "should display user's name" do
      expect(page).to have_content(first_user.name)
    end

    it "can see the number of posts the user has written" do
        expect(page).to have_text("Number of posts: #{first_user.posts.count}")
      end

    it 'should display all post titles' do
      expect(page).to have_content(first_post.title)
      expect(page).to have_content(second_post.title)
    end

    it "should display some of posts' content" do
      expect(page).to have_content(first_post.text[0..100])
      expect(page).to have_content(second_post.text[0..100])
    end

    it 'should display recent comments on a post' do
      expect(page).to have_content(first_comment.text)
    end

    it 'should display comment counts for each post' do
      expect(page).to have_content("Comments: #{first_post.comments_counter}")
      expect(page).to have_content("Comments: #{second_post.comments_counter}")
    end
  end
end
