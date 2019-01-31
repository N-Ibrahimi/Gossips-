class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_tables
  has_many :tags, through: :tag_tables
end
