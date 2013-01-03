class Competence < ActiveRecord::Base
  attr_accessible :name
  has_many :task_competences, :dependent => :destroy
  has_many :tasks, :through => :task_competences
end
