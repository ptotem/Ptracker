class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @project=Project.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.pages.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  def page_list
    @project = Project.find(params[:id])
    @project.pages.build

    respond_to do |format|
      format.html # page_list.html.erb
      format.json { render json: @project }
    end
  end

  def feature_list
    @project = Project.find(params[:id])
    @project.features.build

    respond_to do |format|
      format.html # feature_list.html.erb
      format.json { render json: @project }
    end
  end

  def competence
    @project = Project.find(params[:id])
    @tasks=project.tasks

    respond_to do |format|
      format.html # competence.html.erb
      format.json { render json: @project }
    end
  end


  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.html { redirect_to project_tasks_path(@project), notice: 'Project could not be created.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to project_tasks_path(@project), notice: 'Project was successfully updated.' }
      else
        format.html { redirect_to project_tasks_path(@project), notice: 'Project could not be updated.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
