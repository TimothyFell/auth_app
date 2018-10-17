require 'rails_helper'

describe 'as a visitor' do

  before(:each) do
    @name = 'George'
    @email = 'george123@example.com'
    @password = '123George'
  end

  describe 'when I visit /users/new' do

    it 'they can create an account' do
      visit new_user_path

      fill_in 'user[name]', with: @name
      fill_in 'user[email]', with: @email
      fill_in 'user[password]', with: @password

      click_on 'Create Account'

      expect(current_path).to eq user_path(User.find_by(name: @name))
    end

    it 'they can view their own show page' do
      @user = User.create(name:@name, email:@email, password:@password)
      
      visit user_path(@user)

      expect(page).to have_content(@name)
      expect(page).to have_content(@email)
      expect(page).to_not have_content(@password)
    end

  end


end
