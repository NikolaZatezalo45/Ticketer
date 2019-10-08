class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :number_of_tickets
      t.date :date
      t.references :category, foreign_key: true
      t.string :description
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
