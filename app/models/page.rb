class Page < ActiveRecord::Base
  attr_accessible :name, :project_id, :complete
  belongs_to :project
  has_many :page_tasks, :dependent => :destroy
  has_many :tasks, :through => :page_tasks, :dependent => :destroy

  rails_admin do
    edit do
      field :name
      field :complete
    end
  end

  validates_presence_of :name

  after_create :make_tasks

  def make_tasks
    task_list=["Assets & Mockup", "User Interface", "Integration"]
    task_list_competency=["Design", "UI Coding", "Backend Coding"]
    task_list.each_with_index do |master_task, index|
      task=Task.create!(project_id: project_id, name: "#{name} - #{master_task} ")
      PageTask.create!(task_id: task.id, page_id: id)
      TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
    end
  end

end
