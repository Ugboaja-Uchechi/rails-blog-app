require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET #index' do
    before(:example) { get '/user/:user_id/post' }


    it "should return " do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'has a text in the view' do
      expect(response.body).to include('Watch Euphoria')
    end
  end

    describe 'GET #show' do
      before(:example) { get '/user/:user_id/post/:id' }


    it "should return 200" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'has a text in the view' do
      expect(response.body).to include('Glee')
    end
  end

end