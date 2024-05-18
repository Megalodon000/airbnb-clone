class AddLocationRatingToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :location_rating, :integer
  end
end
