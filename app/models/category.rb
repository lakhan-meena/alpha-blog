class Category < ApplicationRecord
	validates :name, presence: true
	has_many :article_categories
	has_many :categories, through: :article_categories
end
