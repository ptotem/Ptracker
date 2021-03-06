class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  # attr_accessible :title, :body

  ROLES = %w[Admin Projects Sales DevTeam Ex]

  has_many :tasks

  def current_task
    self.tasks.blank? ? nil:self.tasks.where("complete=?", false).last
  end

end
