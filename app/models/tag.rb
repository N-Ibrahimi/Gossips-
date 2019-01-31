class Tag < ApplicationRecord
  has_many :tag_tables
  has_many :gossips, through: :tag_tables
end
