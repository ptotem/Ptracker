class TaskAsset < ActiveRecord::Base
  attr_accessible :task_id, :avatar
  belongs_to :task
  has_attached_file :avatar
end
