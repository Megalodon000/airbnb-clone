class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.string :adress_1
      t.string :adress_2
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
