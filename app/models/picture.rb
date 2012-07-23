class Picture < ActiveRecord::Base
  belongs_to :album
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :album_id, :description, :filename_int, :filename_orig, :licence, :name, :source
  validates :licence, presence: true
end
