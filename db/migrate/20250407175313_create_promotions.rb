class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.text :name
      t.text :description
      t.text :promotion_type

      t.timestamps
    end
  end
end
