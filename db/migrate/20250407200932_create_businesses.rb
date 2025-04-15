class CreateBusinesses < ActiveRecord::Migration[8.0]
  def change
    create_table :businesses do |t|
      t.text :name
      t.text :address
      t.text :phone
      t.text :email
      t.text :website

      t.timestamps
    end
  end
end
