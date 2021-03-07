class AddTotalFavoritedToMovies < ActiveRecord::Migration[5.2]
  def change
  	add_column :movies, :favorited, :integer, null:false, default:0
  end
end
