class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :website
      t.string :phone
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps null: false
    end
  end
end
