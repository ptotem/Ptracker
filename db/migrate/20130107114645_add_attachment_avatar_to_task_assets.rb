class AddAttachmentAvatarToTaskAssets < ActiveRecord::Migration
  def self.up
    change_table :task_assets do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :task_assets, :avatar
  end
end
