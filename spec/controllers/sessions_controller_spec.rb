require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET new' do
    it 'renders the new template' do
      skip
      get :new
      expect(response).to render_template('new')
    end
  end
end
