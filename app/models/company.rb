class Company < ActiveRecord::Base
  belongs_to :user
  has_many :company_taggings, dependent: :destroy
  has_many :company_tags, through: :company_taggings

  def all_company_tags=(names)
    self.company_tags = names.split(',').map do |name|
      CompanyTag.where(name: name).first_or_create!
    end
  end

  def all_company_tags
    company_tags.map(&:name).join(',')
  end
end