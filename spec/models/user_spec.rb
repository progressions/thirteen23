require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let(:user) {  User.new(username: 'mal', email: 'mal@serenity.com', name: 'Malcolm Reynolds', password: 'i<3inara', password_confirmation: 'i<3inara') }

    it 'requires username' do
      user.username = nil
      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'requires name' do
      user.name = nil
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'requires email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end
