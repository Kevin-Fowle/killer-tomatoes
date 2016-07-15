class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :genre

      t.timestamps null: false
    end
  end
end
