class AddContentToCompanyComments < ActiveRecord::Migration
  def change
    add_column :company_comments, :content, :text
  end
end
