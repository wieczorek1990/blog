class Tag < ActiveRecord::Base
  resourcify
  has_and_belongs_to_many :posts
end
