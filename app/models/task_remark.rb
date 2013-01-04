class TaskRemark < ActiveRecord::Base
  attr_accessible :remark, :task_id, :user_id
  belongs_to :task
  belongs_to :user
end
