class PlantsController < InheritedResources::Base
  before_action :set_user

  def index
    if current_user
      @plants = @user.plants
    else
      redirect_to root_path
    end
  end

  def new 
    @plant = Plant.new()
    # plant = new Plant(:realName,:nickName,:waterNeed,:waterCurrent, :sunNeed,:place,:love, :user_id=>@user.id)
    # plant.!save
  end

  def create
    @plant = Plant.new(plant_params.merge(user_id: @user.id))
        if (@plant.save)
            redirect_to plant_path(@plant), notice: 'Plant was successfully created!'
        else
            render :new
        end
  end

  def show
    if !current_user
      redirect_to root_path, notice: 'Please login to see your beautiful plants 🌷🌸🌺🌻'
    else
      if current_user.id != Plant.find(params[:id]).user_id
        redirect_to plants_path, notice: 'This beautiful plant belongs to someone else 😜'
      else
        @plant = Plant.find(params[:id])
      end
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
