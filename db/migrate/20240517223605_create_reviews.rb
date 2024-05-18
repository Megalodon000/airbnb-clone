class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :cleanliness_rating
      t.integer :accuracy_rating
      t.integer :checkin_rating
      t.integer :communication_rating
      t.integer :value_rating
      t.decimal :final_rating
      t.references :user, null: false, foreign_key: true
      t.string :property
      t.string :references

      t.timestamps
    end
  end
end
