class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :groups
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :comments
  has_many :albums
  attr_accessible :name, :email, :def_licence, :description, :email_notify_comment, :password_digest, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates :email, format: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i #, uniqueness: true
end
