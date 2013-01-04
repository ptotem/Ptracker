class Feature < ActiveRecord::Base
  attr_accessible :name, :project_id, :complete, :ftype
  belongs_to :project
  has_many :feature_tasks, :dependent => :destroy
  has_many :tasks, :through => :feature_tasks, :dependent => :destroy

  validates_presence_of :name, :ftype

  rails_admin do
    edit do
      field :name
      field :complete
    end
  end

  validates_presence_of :name

  after_create :make_tasks

  def make_tasks
    case ftype
      when "Tweak"
        task_list=["Tweaking"]
        task_list_competency=["Backend Coding"]
        task_list.each_with_index do |master_task, index|
          task=Task.create!(project_id: project_id, name: "#{project.name} #{name} - #{master_task} ")
          FeatureTask.create!(task_id: task.id, feature_id: id)
          TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
        end
      when "Standard"
        task_list=["Data Model", "Coding", "Testing"]
        task_list_competency=["Data Design", "Backend Coding", "Content"]
        task_list.each_with_index do |master_task, index|
          task=Task.create!(project_id: project_id, name: "#{project.name} #{name} - #{master_task} ")
          FeatureTask.create!(task_id: task.id, feature_id: id)
          TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
        end
      when "Complex"
        task_list=["Data Model", "Fake Data", "Algorithm", "Coding", "Testing"]
        task_list_competency=["Data Design", "Backend Coding", "Logic", "Backend Coding", "Content"]
        task_list.each_with_index do |master_task, index|
          task=Task.create!(project_id: project_id, name: "#{project.name} #{name} - #{master_task} ")
          FeatureTask.create!(task_id: task.id, feature_id: id)
          TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
        end
      when "Greenfield"
        task_list=["Research", "Data Model", "Fake Data", "Algorithm", "Coding", "Testing", "Integration"]
        task_list_competency=["Content", "Data Design", "Backend Coding", "Logic", "Backend Coding", "Content", "Backend Coding"]
        task_list.each_with_index do |master_task, index|
          task=Task.create!(project_id: project_id, name: "#{project.name} #{name} - #{master_task} ")
          FeatureTask.create!(task_id: task.id, feature_id: id)
          TaskCompetence.create!(task_id: task.id, competence_id: Competence.find_by_name(task_list_competency[index]).id)
        end
      else
    end
  end

end
