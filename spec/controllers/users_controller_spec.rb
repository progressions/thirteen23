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
  end
end
