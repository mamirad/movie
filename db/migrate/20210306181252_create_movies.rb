class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :year
      t.string :director
      t.string :main_star
      t.text :description

      t.timestamps
    end
  end
end
