class ProjectsController < ApplicationController
	#dddload_and_authorize_resource :only => [:update, :destroy, :create]
	before_filter :authenticate_user!, :only => [:update, :destroy, :create, :new]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :get_old_comments, :get_new_comments]

  def index
    @projects = Project.all
		@reply = Reply.new
  end

  def show
    @review = Review.new
		@reply = Reply.new
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end

  def get_old_reviews
    @reviews = Review.where("project_id = ? AND id < ?", params[:id], params[:last_rev]).order(created_at: :desc)
    respond_to do |format|
      format.js
    end
  end

  def get_new_reviews
    @reviews = Review.where(project_id: params[:id]).order(created_at: :desc)
    @reviews = @reviews.where("id > #{params[:last_rev]}")
     
    respond_to do |format|
      format.js
    end
  end

  def get_old_comments
    respond_to do |format|
      format.js
    end
  end

  def get_new_comments
    respond_to do |format|
      format.js
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name, :project_description, :project_avatar, :user_id)
    end
end
