class Article < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id
  validates_presence_of :title, :body, :creator_id
end
