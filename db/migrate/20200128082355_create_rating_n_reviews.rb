class CreateRatingNReviews < ActiveRecord::Migration
  def change
    create_table :rating_n_reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.integer :rating
      t.text :review

      t.timestamps null: false
    end
    add_index :rating_n_reviews, [:user_id, :created_at]
    add_index :rating_n_reviews, [:restaurant_id, :created_at]
  end
end
