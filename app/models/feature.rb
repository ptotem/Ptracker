class Feature < ActiveRecord::Base
  attr_accessible :name, :project_id, :complete
  belongs_to :project
  has_many :feature_tasks, :dependent => :destroy
  has_many :tasks, :through => :feature_tasks, :dependent => :destroy

  rails_admin do
    edit do
      field :name
      field :complete
    end
  end

  validates_presence_of :name

  after_create :make_tasks

  def make_tasks
    task_list=["Research", "Data Model", "Fake Data", "Algorithm", "Coding", "Testing", "Integration"]
    task_list_competency=["Content", "Data Design", "Backend", "Logic", "Backend", "Content", "Backend"]
    task_list.each_with_index do |master_task, index|
      task=Task.create!(project_id: project_id, name: "#{project.name} #{name} - #{master_task} ")
      FeatureTask.create!(task_id: task.id, feature_id: id)
      TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
    end
  end

end
