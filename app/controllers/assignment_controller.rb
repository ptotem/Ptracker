class AssignmentController < ApplicationController
  def index
    @users=User.where('role=?', "DevTeam").all
    @user_status=Hash.new
    @user_task=Hash.new
    @users.each do |u|
      if !u.tasks.where("complete=?", false).blank?
        @user_status[u.name]="#{u.tasks.where("complete=?", false).last.full_name}"
        @user_task[u.name]="#{u.tasks.where("complete=?", false).last.id}"
      else
        @user_status[u.name]=""
        @user_task[u.name]=""
      end
    end
  end

  def assign
    task=Task.find(params[:task_id])
    task.user_id=params[:user_id]
    if task.save
      render :text=>"#{task.full_name}||#{task.id}"
    else
      render :text=>"Problem"
    end
  end

end
