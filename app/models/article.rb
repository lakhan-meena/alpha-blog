class Article < ApplicationRecord
	validates :title, :description, :user_id, presence: true
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories
end
