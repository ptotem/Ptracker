class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    if params[:project_id]
      @tasks = Project.find(params[:project_id]).tasks.order('created_at DESC')
    elsif params[:user_id]
      @tasks = User.find(params[:user_id]).tasks.order('created_at DESC')
    else
      @tasks = Task.order('created_at DESC').all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def split_task
    @task = Task.find(params[:id])
    @count=params[:count].to_i
    @count.times do |c|
      task=Task.create!(project_id: @task.project_id, name: "#{@task.name} > Part #{c+1} ")
      TaskCompetence.create!(task_id: task.id, competence_id: @task.task_competences.first.competence_id)
    end
    @task.destroy
    redirect_to :back
  end

  def combine_tasks
    @source = Task.find(params[:source][0])
    @target = Task.find(params[:target][0])
    @target.name = @target.name + " || " + @source.name
    if @target.save
      TaskCompetence.find_all_by_task_id(@source.id).each do |task_competence|
        task_competence.task_id=@target.id
        task_competence.save! unless (TaskCompetence.find_all_by_competence_id_and_task_id(task_competence.competence_id,task_competence.task_id).length>1)
      end
      @source.destroy
    end
    render :text => @target.name
  end


end
