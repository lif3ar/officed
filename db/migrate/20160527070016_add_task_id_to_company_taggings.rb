class AddTaskIdToCompanyTaggings < ActiveRecord::Migration
  def change
    add_column :company_taggings, :task_id, :integer
  end
end
