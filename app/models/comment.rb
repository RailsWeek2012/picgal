class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  attr_accessible :commentable_id, :commentable_type, :content, :user_id
  validates :content, presence: true
end
