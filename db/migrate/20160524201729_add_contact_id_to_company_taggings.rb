class AddContactIdToCompanyTaggings < ActiveRecord::Migration
  def change
    add_column :company_taggings, :contact_id, :integer
  end
end
