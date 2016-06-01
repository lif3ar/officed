class ActivitiesController < ApplicationController
  def index
    @companies = Company.all
    @contacts = Contact.all
    @tasks = Task.all
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User")
  end
end
