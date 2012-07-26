class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :name, :description, :founder
  validates :name, presence: true
end
