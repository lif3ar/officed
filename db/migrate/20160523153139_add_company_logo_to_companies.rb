class AddCompanyLogoToCompanies < ActiveRecord::Migration
  def up
    add_attachment :companies, :company_logo
  end

  def down
    remove_attachment :companies, :company_logo
  end
end
