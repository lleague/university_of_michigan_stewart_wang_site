class AddAttachmentImageToTeamMembers < ActiveRecord::Migration
  def self.up
    change_table :team_members do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :team_members, :image
  end
end
