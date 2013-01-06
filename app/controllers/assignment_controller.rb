class AssignmentController < ApplicationController
  def index
    @users=User.where('role=?', "DevTeam").all
    @user_status=Hash.new
    @user_task=Hash.new
    @users.each do |u|
      if !u.current_task.nil?
        @user_status[u.name]="#{u.current_task.full_name}"
        @user_task[u.name]="#{u.current_task.id}"
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
