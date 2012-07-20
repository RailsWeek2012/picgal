class Album < ActiveRecord::Base
  has_many :pictures
  has_many :comments, :as => :commentable
  attr_accessible :name, :parent_id, :user_id
  validates :name, uniqueness: true
end
