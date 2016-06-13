class RepliesController < ApplicationController

	def create
		@reply = Reply.new(reply_params)
		logger.debug "STAGE replies#create _#{@reply.id}_#{@reply.user_id}_#{@reply.project_id}_#{@reply.reply}_"
		respond_to do |format|
			if @reply.save
			#format.html {render root_path, notice: 'Thanks for reply.'}
			format.js
			else
				flash[:warnings] = 'something went wrong'
			end
		end
	end

	private
		def reply_params
			params.require(:reply).permit(:user_id, :project_id, :reply)
		end
end
