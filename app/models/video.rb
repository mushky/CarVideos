class Video < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 4 }
	validates :description, presence: true, length: { minimum: 4 }
	validates :url, presence: true, length: { minimum: 4 }

	def self.search(query)
		where("description like ?", "%#{query}")
	end
end
