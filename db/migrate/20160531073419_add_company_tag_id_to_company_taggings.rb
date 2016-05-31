class AddCompanyTagIdToCompanyTaggings < ActiveRecord::Migration
  def change
    add_column :company_taggings, :company_tag_id, :integer
  end
end
