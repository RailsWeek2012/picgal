class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_many :picture_comments, :source => :comments, :through => :pictures ## test
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :name, :user_id
  validates :name, presence: true
end
