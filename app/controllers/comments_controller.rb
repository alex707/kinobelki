class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)

    redirect_to project_path(@project)

    #respond_to do |format|
    #  format.js
    #end
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
