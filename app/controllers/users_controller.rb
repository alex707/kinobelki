class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
		#@users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
		@search = User.search(params[:q])
		@users = @search.result(distinct: true)
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
  
end
