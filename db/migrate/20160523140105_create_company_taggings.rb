class CreateCompanyTaggings < ActiveRecord::Migration
  def change
    create_table :company_taggings do |t|

      t.timestamps null: false
    end
  end
end
