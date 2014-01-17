class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, presence: true

  scope :by_popularity, -> { order('articles.votes DESC') }
  scope :by_newest, -> { order('articles.created_at DESC') }
  scope :proper_order, -> { by_popularity.by_newest }

end
