class CompanyTagging < ActiveRecord::Base
  belongs_to :company
  belongs_to :company_tag
end
