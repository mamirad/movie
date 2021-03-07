class Movie < ApplicationRecord
  has_many :favourite_movies, dependent: :destroy
 has_many :users, through: :favourite_movies
	enum genres: [:Action,:Adventure,:Animation,:Biography,:Comedy,:Crime,:Documentary,:Drama,:Fantasy,:History,:Horror,:Musical,:Mystery,:Romance,:Sci_Fi,:Thriller,:War,:Western]
	validates :name, length: { maximum: 80 }
	validates :name, presence: true
	validates :movie_genres, presence: true
	validates :year, presence: true
	validates_numericality_of :year, :greater_than_or_equal_to => 1000, :less_than_or_equal_to => 9999, :message => "Year should be 4 digit"
  	validates :director, length: { maximum: 60 }, allow_blank: true
  	validates :main_star, length: { maximum: 60 }, allow_blank: true
  	validates :description, length: { maximum: 400 }, allow_blank: true
  	validate :validate_genres
  	def validate_genres
  		if self.movie_genres.reject(&:empty?).blank?
    		errors.add(:movie_genres, "Must Present at least one") 
    	end
  	end



end
