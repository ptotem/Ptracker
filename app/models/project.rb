class Project < ActiveRecord::Base
  attr_accessible :internal, :name, :pages_attributes, :features_attributes, :tasks_attributes, :complete
  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :features, :dependent => :destroy
  accepts_nested_attributes_for :features, allow_destroy: true
  accepts_nested_attributes_for :pages, allow_destroy: true
  accepts_nested_attributes_for :tasks
  validates_presence_of :name

  rails_admin do
    weight 1
    list do
      field :name
      field :internal
    end
    edit do
      field :internal
      field :complete
      field :name
      field :pages
    end
  end

  after_create :make_tasks

  def make_tasks
    task_list=["Initialization", "Graphic Design", "Data Design", "Access Control", "Algorithm", "Development", "Deployment"]
    init_tasks=["Feature List", "Wireframes", "Page List"]
    task_list_competency=["Content", "Design", "Logic"]
    init_tasks.each_with_index do |master_task, index|
      task=Task.create!(project_id: id, name: "#{name} #{master_task}")
      TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
    end
    task_list.each do |master_task|
      Task.create!(project_id: id, name: "#{name} #{master_task} Approval", user_id: 2)
    end
  end

end
