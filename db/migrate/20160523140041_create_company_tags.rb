class CreateCompanyTags < ActiveRecord::Migration
  def change
    create_table :company_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
