require 'active_record'



class UsersModel < ActiveRecord::Base
  attr_accessible :count, :password, :user
  validates :user, :presence => true, :uniqueness => true, :length => {:maximum => 128}
  validates :password, :length => {:maximum => 128}
end
