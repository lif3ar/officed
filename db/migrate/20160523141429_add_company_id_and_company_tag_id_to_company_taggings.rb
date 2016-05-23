class AddCompanyIdAndCompanyTagIdToCompanyTaggings < ActiveRecord::Migration
  def change
    add_column :company_taggings, :company_id, :integer
    add_column :company_taggings, :company_tag_id, :integer
  end
end
