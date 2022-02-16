require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET #index' do
    before(:example) { get('/user') }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'has a text in the view' do
      expect(response.body).to include('Game of thrones')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/user/:id' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'has a text in the view' do
      expect(response.body).to include('Harry Potter')
    end
  end
end
