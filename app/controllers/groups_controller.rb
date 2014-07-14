class GroupsController < ApplicationController
  def new
  	@group = Group.new
  end
  def create
    @group = Group.new(group_params)
    if signed_in?
    	@group.user_id = current_user.id
	else
		render 'new'
	end

    if @group.save
      flash[:success] = "Your group has been created!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def index
    @groups = Group.paginate(page: params[:page])
  end

	def show
    @group = Group.find(params[:id])
  end

  private

    def group_params
      params.require(:group).permit(:name, :description)
    end


    

end
