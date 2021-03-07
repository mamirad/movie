class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: [:user,:admin]

 has_many :favourite_movies, dependent: :destroy
 has_many :movies, through: :favourite_movies
      
end
