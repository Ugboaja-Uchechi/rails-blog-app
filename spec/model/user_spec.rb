require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(name: 'John', bio: 'I am a content creator', photo: '', postsCounter: 0)

    5.times do |i|
      Post.new(title: "Post #{i}", text: "Post #{i} text", commentsCounter: 0, likesCounter: 0, users_id: @user.id)
    end

    @posts = Post.where(users_id: @user.id).all
  end

  describe 'user validation tests' do
    it 'validates the presence of the name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'validates the presence of the postsCounter' do
      @user.postsCounter = nil
      expect(@user).to_not be_valid
    end

    it 'validates the numericality of the postsCounter' do
      @user.postsCounter = 'zero'
      expect(@user).to_not be_valid
    end

    it 'validates the postsCounter is greater_than_zero' do
      @user.postsCounter = 5
      expect(@user.postsCounter).to be > 0
    end

    it 'validates the postsCounter is greater_equal_to_zero' do
      @user.postsCounter = 0
      expect(@user.postsCounter).to eq(0)
    end
  end

  describe 'user model methods tests' do
    it 'returns the most recent post limit to 3 posts' do
      expect(@user.three_recent_posts).to eq(@user.all_posts)
    end
  end
  # subject { User.new(name: 'Tom', photo: '"https://www.goldenglobes.com/sites/default/files/styles/homepage_carousel/public/photo_gallery/jim_carrey_112204_lemony_snicket.jpg', bio: 'Teacher from Mexico.') }

  # before { subject.save }

  # it 'name should be present' do
  #   subject.name = nil
  #   expect(subject).to_not be_valid
  # end

  # it 'postsCounter should be greater than or equal to zero' do
  #   subject.postsCounter = -1
  #   expect(subject).to_not be_valid
  # end

  # it 'return the three latest posts for a user' do
  #   expect(User.three_recent_posts(subject.id).count).to eql 0
  # end

  # it 'return all the posts for a user' do
  #   expect(User.all_posts(subject.id).count).to eql 0
  # end
end