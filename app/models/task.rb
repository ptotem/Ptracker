class Task < ActiveRecord::Base
  attr_accessible :name, :project_id, :task_competences_attributes, :user_id, :start_date, :end_date, :duration
  belongs_to :project
  belongs_to :user
  has_many :task_competences, :dependent => :destroy
  has_many :competences, :through => :task_competences
  accepts_nested_attributes_for :task_competences

  rails_admin do
    weight 2
    list do
      field :project
      field :name
      field :user
      field :competences
    end
    edit do
      field :project
      field :name
      field :user
      field :task_competences
    end
  end

  def uname
    self.user.blank? ? "Unassigned": self.user.name
  end

end
