class Page < ActiveRecord::Base
  attr_accessible :name, :project_id, :complete
  belongs_to :project

  rails_admin do
    edit do
      field :name
      field :complete
    end
  end

  validates_presence_of :name

  after_create :make_tasks

  def make_tasks
    task_list=["Contents", "Wireframe", "Page Design", "Page Mockup", "Controller Logic", "Integration"]
    task_list_competency=["Content", "Design", "Design", "UI", "Backend", "Logic"]
    task_list.each_with_index do |master_task, index|
      task=Task.create!(project_id: project_id, name: "#{project.name} #{name} - #{master_task} ")
      PageTask.create!(task_id: task.id, page_id: id)
      TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
    end
  end

end
