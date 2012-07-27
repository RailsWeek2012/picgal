class Picture < ActiveRecord::Base
  belongs_to :album
  has_one :user, :through => :albums
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :album_id, :description, :licence, :name, :source, :image, :remote_image_url
  validates :name, presence: true
  validates :licence, presence: true
  mount_uploader :image, ImageUploader
end
