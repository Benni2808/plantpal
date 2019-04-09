class PlantsController < InheritedResources::Base
  before_action :set_user

  def index
    if current_user
      @plants = @user.plants
    else
      redirect_to root_path
    end
  end
  private
    def plant_params
      params.require(:plant).permit(:realName, :nickName, :waterNeed, :waterCurrent, :sunNeed, :place, :love, :image)
    end

    def set_user
      @user = current_user
    end

end
