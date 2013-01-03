class TaskCompetence < ActiveRecord::Base
  attr_accessible :competence_id, :difficult, :task_id
  belongs_to :task
  belongs_to :competence

  rails_admin do
    edit do
      field :competence
      field :difficult
    end
  end

end
