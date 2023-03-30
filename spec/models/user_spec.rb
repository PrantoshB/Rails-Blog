require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    first_user = User.create(name: 'Prantosh', photo: 'https://avatars.githubusercontent.com/u/93311467?v=4', bio: 'Full-Stack Developer', posts_counter: 0)

    it 'is not valid without a name' do
      first_user.name = nil
      expect(first_user).to_not be_valid
    end

    it 'post_counter should be numeric' do
      subject.posts_counter = ''
      expect(subject).to_not be_valid
    end

    it 'post_counter should be greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'post_counter should be an integer' do
      subject.posts_counter = 1.5
      expect(subject).to_not be_valid
    end
  end
end
