require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
    user = User.new
      assert !user.save
      assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?

  end



  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?

  end

  test "a user should have an unique profile name" do
    user = User.new
    user.profile_name = users[:jacky].profile_name

    assert !user.save
    asset !user.errors[:profile_name].empty?
  end


  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "My Profile"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.erros[:profile_name].include?("Must be formatted correctly")
  end





end
