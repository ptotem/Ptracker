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
    task_list=["Feature List", "Wireframes", "Page List", "Initialization Approval", "Initialization"]
    task_list_competency=["Architecture", "Design", "Architecture", "Architecture", "Architecture"]
    task_list_remarks=["Put the Feature List in the Ptracker to complete",
                       "Create a remark containing the Balsamic URL to the wireframes to complete",
                       "Put the Page List in the Ptracker to complete",
                       "",
                       "Finalize name for the Project; Create the Git Repository; Edit the Readme to include the Feature List and Page List; Complete Project Planning by rearranging the Tasks into Dailies"]
    task_list.each_with_index do |master_task, index|
      task=Task.create!(project_id: id, name: "#{master_task}", remark: task_list_remarks[index])
      TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
    end
  end

  def incomplete_tasks
    #self.tasks.blank? ? "":self.tasks.where(complete=false).all
    Task.all
  end

end
