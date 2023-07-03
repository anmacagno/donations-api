class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.string :email, null: false
      t.decimal :amount, precision: 11, scale: 2, null: false
      t.string :currency, null: false
      t.references :payable, polymorphic: true, null: false
      t.text :request

      t.timestamps
    end
  end
end
