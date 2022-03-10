require 'rails_helper'
RSpec.describe 'Login', type: :feature do
 describe 'User' do
  before(:each) do
    @user = User.create(name: 'Tom', password: '111111', bio: 'First time user', email: 'stephanie@gmail.com',
    confirmed_at: Time.now, postsCounter: 0)
    @post = Post.new(
      author:@user,
      title:"Actor",
      text: 'Funny.',
      likesCounter: 0,
      commentsCounter: 0
    )
    @comment1 = Comment.create(text:'Thank you very much for sharing your experience with us', author:@user, post:@post)
    @comment2 = Comment.create(text:"We're happy you are satisfied with the quality of our", author:@user, post:@post)
    @comment3 = Comment.create(text:'Thank you very much for sharing your experience with us', author:@user, post:@post)
    Comment.update_comments_counter(@post.id)
    @post.save
    visit root_path
    fill_in 'Email', with: 'stephanie@gmail.com'
    fill_in 'Password', with: '111111'
    click_button 'Log in'
    visit user_post_path(@user.id, @post)
  end
  it 'Should show the post title' do
    expect(page).to have_content('Actor')
  end
  it 'Should show who wrote the post' do
    expect(page).to have_content('Actor by Tom')
  end
  it 'Should show how many comments the post has' do
    expect(page).to have_content('Comments: 3')
  end
  it 'Should show how many likes the post has' do
    expect(page).to have_content('Likes: 0')
  end
  it "Should show the post's body" do
    expect(page).to have_content('Funny.')
  end
  it 'Should show the username of each commentor' do
    expect(page).to have_content('Tom:')
  end
  it 'Should show the comment each commentor left' do
    expect(page).to have_content('Thank you very much for sharing your experience with us')
    expect(page).to have_content("We're happy you are satisfied with the quality of our")
    expect(page).to have_content('Thank you very much for sharing your experience with us')
  end
 end
end