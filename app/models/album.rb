class Album < ActiveRecord::Base
  has_many :pictures
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :name, :user_id
  validates :name, presence: true
end
