module Global
  def all_company_tags=(names)
    self.company_tags = names.split(',').map do |name|
      CompanyTag.where(name: name).first_or_create!
    end
  end

  def all_company_tags
    company_tags.map(&:name).join(',')
  end
end
