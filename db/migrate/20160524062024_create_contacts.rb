class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :company
      t.text :description
      t.string :email
      t.string :work
      t.string :mobile
      t.string :home
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps null: false
    end
  end
end
