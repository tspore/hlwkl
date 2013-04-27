class Comment < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :guess, uniqueness: true, presence: true
end
