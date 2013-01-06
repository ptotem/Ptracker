class Task < ActiveRecord::Base
  attr_accessible :name, :project_id, :task_remarks_attributes, :task_competences_attributes, :user_id, :start_date, :end_date, :duration, :remark, :complete
  belongs_to :project
  belongs_to :user
  has_many :task_competences, :dependent => :destroy
  has_many :competences, :through => :task_competences
  accepts_nested_attributes_for :task_competences

  before_save :set_start_date

  rails_admin do
    weight 2
    list do
      field :project
      field :name
      field :user
      field :competences
      field :complete
    end
    edit do
      field :project
      field :name
      field :user
      field :start_date
      field :complete
      field :task_competences
    end
  end

  def uname
    self.user.blank? ? "Unassigned" : self.user.name
  end

  def full_name
    self.project.blank? ? name : "#{self.project.name} #{name}"
  end

  def self.for_select
    Project.all.map do |project|
      [project.name, project.tasks.where(complete: false).where(user_id: nil).map { |c| ["#{c.name} ( #{c.competences.map{|comp| comp.name}.join(", ")} )", c.id] }]
    end
  end

  def set_start_date
    unless self.user_id.blank?
      if self.start_date.blank?
        self.start_date=Date.today
      end
    end
  end

end
