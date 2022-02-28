require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before(:each) do
    @user = User.new(id: 2, name: 'Lily', bio: 'I am a teacher', photo: '', postsCounter: 0)
    @post = Post.new(title: 'First Post', text: 'How is work going', commentsCounter: 4, likesCounter: 0, author_id: @user.id)
    @comment = Comment.new(text: 'Nice Post', author_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the author_id is an integer' do
      @comment.author_id = 2
      expect(@comment.author_id).to eq(2)
    end

    it 'validates the author name' do
      expect(@comment.author.name).to eq('Lily')
    end

    it 'validates the post_id is an integer' do
      @comment.post_id = 2
      expect(@comment.post_id).to eq(2)
    end

    it 'validates the comment text' do
      expect(@comment.text).to eq('How is work going')
    end
  end

  describe 'comemnt model methods tests' do
    it 'it should increment the post comments_counter' do
      @post.save
      @comment.update_comments_counter
      expect(@post.comments_counter).to eq(4)
    end
  end
end
