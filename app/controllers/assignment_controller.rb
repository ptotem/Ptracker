class AssignmentController < ApplicationController
  def index
    @users=User.where('role=? or role=?', "DevTeam", "Projects").all
    @user_status=Hash.new
    @users.each do |u|
      if !u.tasks.where("complete=?", false).blank?
        @user_status[u.name]="#{u.tasks.where("complete=?", false).last.project.name} #{u.tasks.where("complete=?", false).last.name}"
      else
        @user_status[u.name]=""
      end
    end
  end
end
