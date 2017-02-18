class Article < ApplicationRecord
	validates_uniqueness_of :title, :body
	validates_presence_of :title, :body
end
