class Task < ActiveRecord::Base
  include Global

  belongs_to :user
  has_many :company_taggings
  has_many :company_tags, through: :company_taggings
end