class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  self.per_page = 5
end
