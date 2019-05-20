require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'user can be created when valid' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@hotmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to be_valid
    end

    it 'user can not be created when passwords do not match' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@hotmail.com',
        password: '123456',
        password_confirmation: '1234567'
      )
      expect(user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end

    it 'user can not be created when password is blank' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@hotmail.com',
        password: '',
        password_confirmation: '123456'
      )
      expect(user.errors.full_messages).to include('Password can\'t be blank')
    end

    it 'user can not be created when first name is blank' do
      user = User.create(
        first_name: nil,
        last_name: 'test',
        email: '123@hotmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user.errors.full_messages).to include('First name can\'t be blank')
    end

    it 'user can not be created when last name is blank' do
      user = User.create(
        first_name: 'test',
        last_name: nil,
        email: '123@hotmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user.errors.full_messages).to include('Last name can\'t be blank')
    end

    it 'user can not be created when email is blank' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: nil,
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'users cannot use the same email for two accounts' do
      User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@example.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@EXAmple.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user.errors.full_messages).to include('Email has already been taken')
    end
    
    it 'user can not be created when password is less than 6 characters' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@hotmail.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  end

  describe 'authenticate_with_credentials' do
    it 'should return the correct user' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@example.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user2 = User.authenticate_with_credentials('123@example.com', '123456')
      expect(user2).to eql(user)
    end

    it 'should return nil if incorrect password' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@example.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user2 = User.authenticate_with_credentials('123@example.com', '12345')
      expect(user2).to eql(nil)
    end

    it 'should return nil if no email exists' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@example',
        password: '123456',
        password_confirmation: '123456'
      )
      user2 = User.authenticate_with_credentials('123@example.com', '123456')
      expect(user2).to eql(nil)
    end

    it 'should return the correct user' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@example.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user2 = User.authenticate_with_credentials('123@example.com', '123456')
      expect(user2).to eql(user)
    end

    it 'should return the correct user' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: '123@example.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user2 = User.authenticate_with_credentials('123@example.com', '123456')
      expect(user2).to eql(user)
    end
  end
end
