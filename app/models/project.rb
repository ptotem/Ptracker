class Project < ActiveRecord::Base
  attr_accessible :internal, :name, :pages_attributes, :tasks_attributes, :complete
  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
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
    task_list=["Data Modelling", "Database Design", "Admin Section", "Algorithm", "Factory Data", "Coding Logic", "Deployment"]
    task_list_competency=["Datamodel", "Datamodel", "Logic", "Logic", "Content", "Backend", "Backend"]
    task_list.each_with_index do |master_task, index|
      task=Task.create!(project_id: id, name: "#{name} #{master_task} ")
      TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
    end
  end

end
