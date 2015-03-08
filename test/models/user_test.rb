require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: 'Steph', 
                     email: 'steph@gmail.com',
                     password: 'foobar',
                     password_confirmation: 'foobar')
  end
  
  test "should be valid" do
       assert @user.valid?
  end
  
  test "requires a name to be set" do
    @user.name = nil
    assert_not @user.valid?
  end
  
  test "requires an email to be set" do
    @user.email = nil
    assert_not @user.valid?
  end
  
  test 'requires the user name to be more than 3 chars' do
    @user.name = '12'
    assert_not @user.valid?
  end
  
  test "names should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password should have a minimum length of 6 chars" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
