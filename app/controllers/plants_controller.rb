class PlantsController < InheritedResources::Base
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def create
    @plant = Plant.new(plant_params.merge(user_id: @user.id))
    respond_to do | format |
      if @plant.save
        format.html {redirect_to @plant, notice: 'Pflanze neu'}
      else
        format.html {render :new}
      end
    end
  end

  def show
    if !current_user
      redirect_to root_path, notice: 'Please login to see your beautiful plants 🌷🌸🌺🌻'
    else
      if current_user.id != Plant.find(params[:id]).user_id
        redirect_to plants_path, notice: 'This beautiful plant belongs to someone else 😜'
      else
          if @plant.image.attached?
            @plant_image = polymorphic_url @plant.image
          else
            @plant_image = '/assets/default.jpg'
          end
      end
    end
  end

   def update
    respond_to do | format |
      if(params[:water])
        puts 'water is true'
        @plant.waterCurrent = @plant.waterNeed
        @plant.love = 10
        @plant.save
        format.html {redirect_to @plant, notice: 'Pflanze wieder fit'}
      elsif @plant.update(plant_params)
        puts 'success'
        format.html {redirect_to @plant, notice: 'Pflanze geändert'}
      else
        format.html {render :edit }
      end
    end
   end

    def destroy
      @plant.destroy
      respond_to do | format |
        format.html {redirect_to dashboard_path, notice: 'Pflanze leider verdorben'}
      end
    end

  private
    def plant_params
      params.require(:plant).permit(:realName, :nickName, :waterNeed, :waterCurrent, :sunNeed, :place, :love, :image)
    end

    def set_user
      @user = current_user
    end

    def set_plant
      @plant = Plant.find(params[:id])
    end
end