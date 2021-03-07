class AddGenresToMovie < ActiveRecord::Migration[5.2]
  def change
  	add_column :movies, :movie_genres, :string, array: true, default: []
  end
end
