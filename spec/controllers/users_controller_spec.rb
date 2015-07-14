require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:mal) {  User.create(username: 'mal', email: 'mal@serenity.com', name: 'Malcolm Reynolds', password: 'i<3inara', password_confirmation: 'i<3inara') }
  let(:inara) {  User.create(username: 'inara', email: 'inara@serenity.com', name: 'Inara Serra', password: 'i<3mal', password_confirmation: 'i<3mal') }

  describe 'GET index' do
    it 'assigns @users' do
      mal.update_attribute(:created_at, 1.week.ago)
      inara.update_attribute(:created_at, 1.minute.ago)

      get :index
      expect(assigns[:users]).to eq([mal, inara])
    end

    it 'renders index' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      let(:valid_params) { { user: {username: 'river', email: 'river@serenity.com', name: 'River Tam', password: 'iswa11owedabug', password_confirmation: 'iswa11owedabug'} } }

      it 'creates user' do
        post :create, valid_params
        expect(User.last.username).to eq('river')
      end

      it 'notifies user of success' do
        post :create, valid_params
        expect(controller.flash[:notice]).to eq('User created successfully.')
      end

      it 'redirects user to profile page' do
        post :create, valid_params
        expect(response).to redirect_to(user_profile_url(User.last))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { user: {email: 'river@serenity.com', name: 'River Tam', password: 'iswa11owedabug', password_confirmation: 'iswa11owedabug'} } }

      it 'does not create user without username' do
        post :create, invalid_params
        expect(User.last).to be_nil
      end

      it 'notifies user of error' do
        post :create, invalid_params
        expect(controller.flash[:error]).to eq('There was a problem creating this user.')
      end
    end
  end
end
