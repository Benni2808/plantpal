class PlantsController < InheritedResources::Base

  private

    def plant_params
      params.require(:plant).permit(:realName, :nickName, :waterNeed, :waterCurrent, :sunNeed, :place, :love, :image)
    end

end
