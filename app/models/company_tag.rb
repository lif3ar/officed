class CompanyTag < ActiveRecord::Base
  has_many :company_taggings, dependent: :destroy
  has_many :companies, through: :company_taggings
end
