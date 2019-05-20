require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'user can be created when valid' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@hotmail.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(user).to be_valid
    end

    it 'user can not be created when passwords do not match' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@hotmail.com',
        password: '124',
        password_confirmation: '123'
      )
      expect(user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end
  end
end
