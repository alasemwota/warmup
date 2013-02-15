ENV["RAILS_ENV"] = "test"
require 'users_model_controller'

class UsersModelTestController < ApplicationController

	respond_to :json
	attr_accessor :failed, :output

	def testAll
		'''Now call all tests manually because rspec refused to work!!!'''
		puts "Welcome to testAll"
		@failed = 12
		@failed -= self.testLoginNonUser
		@output = ""
		render json: {:totalTests => 12, :nrFailed => @failed, :output => @output}
		return 0
	end
	
	def testLoginNonUser
		
		user_control = UsersModelController.new
		result = user_control.login("user1", "pass1")
		puts result
		
		'''
		system("echo "" > output.out")
		result = system(ENV["RAILS_ENV"],"./curl1.sh > output.out")
		contents = File.read("output.out")
		puts "Here is the content" + contents
		output = contents.split("\n")[-1]
		if output != nil
			@output += output
		end
		puts output
		if output == {"errCode":-1}
			return 1
		else
			return 0
		end
		puts "End of tests! Yay"
		'''
	end
		
end
