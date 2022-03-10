require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'User' do
    before(:each) do
      @photo = 'https://itsastampede615821596.files.wordpress.com/2020/12/how-many-dumb-and-dumber-movies-are-there.jpg'
      @user1 = User.create! name: 'LLoyd', photo: @photo, password: 'lloydd', email: 'stephanieuchechi754@gmail.com',
                            confirmed_at: Time.now
      @user2 = User.create! name: 'other user', photo: @photo, password: 'otherr', email: 'uchechiugboaja@gmail.com',
                            confirmed_at: Time.now
      visit('/users/sign_in')
      fill_in 'Email', with: 'stephanieuchechi754@gmail.com'
      fill_in 'Password', with: 'lloydd'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('LLoyd')
      expect(page).to have_content('other user')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show users page when clicked' do
      click_on 'LLoyd'
      expect(page).to have_current_path user_path(@user1)
    end
  end
end