class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rater_id
      t.integer :review_id
      t.integer :helpful_score
      t.integer :agree_score
      t.timestamps null: false
    end
  end
end
