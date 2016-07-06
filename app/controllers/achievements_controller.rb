class AchievementsController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@achievement = @project.achievements.create(achievement_params)
		redirect_to project_path(@achievement)
	end

	def destroy
		@project = Project.find(params[:project_id])
		@achievement = @project.achievements.find(params[:id])
		@achievement.destroy
		redirect_to project_path(@project)
	end

private
	def achievement_params
		params.require(:achievement).permit(:user_id, :body)
	end
end
