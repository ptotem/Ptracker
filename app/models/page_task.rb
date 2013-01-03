class PageTask < ActiveRecord::Base
  attr_accessible :page_id, :task_id, :complete
  belongs_to :page
  belongs_to :task
end
