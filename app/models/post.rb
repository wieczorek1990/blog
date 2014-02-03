class Post < ActiveRecord::Base
  resourcify
  searchkick text_start: [:title]
  has_and_belongs_to_many :tags
  has_many :comments
  self.per_page = 5
  validates :title, presence: true
  validates :content, presence: true
end
