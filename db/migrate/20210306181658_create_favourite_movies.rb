class CreateFavouriteMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_movies do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
