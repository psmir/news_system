class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, presence: true

  paginates_per 10

  scope :by_popularity, -> { order('articles.votes DESC') }
  scope :by_newest, -> { order('articles.created_at DESC') }
  scope :proper_order, -> { order('articles.votes DESC, articles.created_at DESC') }
  scope :by_user_id, -> (id) { where("user_id = ?", id) }

end
