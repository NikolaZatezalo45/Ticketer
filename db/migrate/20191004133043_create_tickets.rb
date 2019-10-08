class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :number
      t.references :event, foreign_key: true
      t.boolean :sold_originally, default: false
      t.boolean :sold_on_marketplace, default: false
      t.boolean :onresell, default: false
      t.float :price
      t.references :purchaser, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
