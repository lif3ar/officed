class AddContactAvatarToContacts < ActiveRecord::Migration
  def up
    add_attachment :contacts, :contact_avatar
  end

  def down
    remove_attachment :contacts, :contact_avatar
  end
end
