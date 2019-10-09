class CreateAccountTansctions < ActiveRecord::Migration[5.2]
  def change
    create_table :account_tansctions do |t|
      t.float :amount
      t.references :account, foreign_key: true
      t.string :note

      t.timestamps
    end
  end
end
