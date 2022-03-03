require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: '"https://www.goldenglobes.com/sites/default/files/styles/homepage_carousel/public/photo_gallery/jim_carrey_112204_lemony_snicket.jpg', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be greater than or equal to zero' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'return the three latest posts for a user' do
    expect(User.three_recent_posts(subject.id).count).to eql 0
  end

  it 'return all the posts for a user' do
    expect(User.all_posts(subject.id).count).to eql 0
  end
end