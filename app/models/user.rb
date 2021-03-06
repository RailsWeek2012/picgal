class User < ActiveRecord::Base
  #TODO [6]: E-Mail-Validierung, "has_secure_password" und "password_digest" aus BMM-Foliensatz
  has_secure_password
  has_and_belongs_to_many :groups
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :comments
  has_many :albums, :dependent => :destroy
  has_many :pictures, :through => :albums
  attr_accessible :name, :email, :def_licence, :description, :password_digest, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates :email, format: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i , uniqueness: true
end
