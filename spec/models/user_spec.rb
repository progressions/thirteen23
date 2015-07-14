require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let(:mal) { User.new(username: 'mal', email: 'mal@serenity.com', name: 'Malcolm Reynolds', password: 'i<3inara', password_confirmation: 'i<3inara') }
    let(:inara) { User.create(username: 'inara', email: 'inara@serenity.com', name: 'Inara Serra', password: 'i<3mal', password_confirmation: 'i<3mal') }

    it 'requires username' do
      mal.username = nil
      expect(mal).not_to be_valid
      expect(mal.errors[:username]).to include("can't be blank")
    end

    it 'requires name' do
      mal.name = nil
      expect(mal).not_to be_valid
      expect(mal.errors[:name]).to include("can't be blank")
    end

    it 'requires email' do
      mal.email = nil
      expect(mal).not_to be_valid
      expect(mal.errors[:email]).to include("can't be blank")
    end

    it 'requires unique username' do
      mal.username = inara.username
      expect(mal).not_to be_valid
      expect(mal.errors[:username]).to include("has already been taken")
    end

    it 'requires unique email' do
      mal.email = inara.email
      expect(mal).not_to be_valid
      expect(mal.errors[:email]).to include("has already been taken")
    end

    it 'rejects invalid usernames' do
      %w(signup signin signout users).each do |reserved_word|
        mal.username = reserved_word
        expect(mal).not_to be_valid
        expect(mal.errors[:username]).to include("is reserved")
      end
    end
  end
end
