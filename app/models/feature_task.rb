class FeatureTask < ActiveRecord::Base
  attr_accessible :feature_id, :task_id
  belongs_to :feature
  belongs_to :task
end
