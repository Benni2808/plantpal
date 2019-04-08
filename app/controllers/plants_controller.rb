class PlantsController < InheritedResources::Base
  before_action :set_user

  def index
    @plants = @user.plants
  end
  private
    def plant_params
      params.require(:plant).permit(:realName, :nickName, :waterNeed, :waterCurrent, :sunNeed, :place, :love, :image)
    end

    def set_user
      @user = current_user
    end

end
