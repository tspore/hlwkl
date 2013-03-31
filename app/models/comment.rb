class Comment < ActiveRecord::Base
  attr_accessible :comment, :email, :guess, :name
end
