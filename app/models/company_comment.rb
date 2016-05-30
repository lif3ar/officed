class CompanyComment < ActiveRecord::Base
  include PublicActivity::Common
  # tracked except: :create, owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  belongs_to :company
end
