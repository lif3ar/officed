class AddCompanyIdToCompanyTaggings < ActiveRecord::Migration
  def change
    add_column :company_taggings, :company_id, :integer
  end
end
