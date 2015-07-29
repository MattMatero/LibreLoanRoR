require 'rails_helper'

describe HomeController do
  render_views
  before(:each) { sign_in create(:user) }

  describe 'GET index' do
    it 'renders w/o error' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'new' do
    it 'renders w/o error' do
      get :profile
      expect(response).to be_success
    end
  end

end