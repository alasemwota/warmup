#require '/var/lib/gems/1.9.1/gems/rspec-expectations-2.12.1/spec/spec_helper'
require 'spec_helper'
require 'users_model_controller'

describe UsersModelController do 

	

	it "Does not allow a non-registered user login" do
		user_control = UsersModelController.new
		user_control.login("userO", "PASS0").should eq(-1)
		
	end

	it "Allows a user that supplies only a username get added" do
		user_control = UsersModelController.new
		user_control.add("user1","").should eq(1)
	end

	it "Allows a user with a username and password get added" do
		user_control = UsersModelController.new
		user_control.add("user2", "PASS2").should eq(1)
	end

	it "Doesn't allow an already added user get added again" do 
		user_control = UsersModelController.new
		user_control.add("user1","").should eq(-2)
	end

	it "Doesn't allow a blank username get added" do
		user_control = UsersModelController.new
		user_control.add("", "PASS0").should eq(-3)
	end

	it "It allows a username and password of 128 characters" do
		user_control = UsersModelController.new
		user_control.add("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").should eq(1)	
	end

	it "Does not allow a username greater than 128 characters" do
		user_control = UsersModelController.new
		user_control.add("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","PASS0")
.should eq(-3)
	end

	it "Does not allow a password greater than 128 characters" do
		user_control = UsersModelController.new
		user_control.add("user3", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").should eq(-4)
	end

	it "Allows a registered user with a password to login and counts number of logins" do
		user_control = UsersModelController.new
		user_control.login("user2", "PASS2").should eq(2)
	end

	it "Allows a registered user without a password to login and counts number of logins" do
		user_control = UsersModelController.new
		user_control.login("user1", "").should eq(2)
	end

	it "Doesn't allow a user with wrong password to login" do
		user_control = UsersModelController.new
		user_control.login("user1", "PASS1").should eq(-1)
	end
	
	it "Sucessfully Deletes the DB with call to TESTAPI_reset_fixture" do
		user_control = UsersModelController.new
		user_control.TESTAPI_resetFixture.should eq(1)
	end
	

end

