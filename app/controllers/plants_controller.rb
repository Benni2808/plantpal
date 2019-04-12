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
        format.html {redirect_to @plant, notice: 'Neuer Pal erstellt'}
      else
        format.html {render :new}
      end
    end
  end

  def show
    if !current_user
      redirect_to root_path, notice: 'Bitte logge dich ein um deine Pals zu sehen 🌷🌸🌺🌻'
    else
      if current_user.id != Plant.find(params[:id]).user_id
        redirect_to plants_path, notice: 'Hey, diese schöne Pflanze gehört jemand anderem 😜'
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
        @plant.save
        format.html {redirect_to @plant, notice: 'Dein Pal ist wieder fit'}
      # elsif params[:api]
      #   puts 'api is true'
      #   image_to_base64
      #   format.html {redirect_to @plant, notice: 'Abfrage gestartet'}
      elsif @plant.update(plant_params)
        puts 'success'
        format.html {redirect_to @plant, notice: 'Der Zustand deines Pals hat sich geändert'}
      else
        format.html {render :edit }
      end
    end
   end

    def destroy
      @plant.destroy
      respond_to do | format |
        format.html {redirect_to dashboard_path, notice: 'Oh nein, deine Pflanze ist leider verdorben!'}
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

    # def image_to_base64
    #   require 'base64'
    #   puts 'data:image/jpeg;base64,' + Base64.strict_encode64(:image)
    # end

    # def make_post_req_plant
    #   require 'httparty'
    #   require 'json'
  
    #   route = 'https://api.plant.id/identify'
    #   body = {
    #     'key' => '50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov',
    #     'images' => [130772, 307675]
    #   }
    #   response = HTTParty.post(route, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    #   res = response.parsed_response
    #   p res
    # end

    # def make_post_req_plant_check_identification
    #   require 'httparty'
    #   require 'json'
  
    #   route = 'https://api.plant.id/check_identifications'
    #   body = {
    #     'key' => '50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov',
    #     'ids' => [130772, 307675]
    #   }
    #   response = HTTParty.post(route, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    #   res = response.parsed_response
    #   p res
    # end
  
    # def make_post_req_trefle
    #   require 'net/http'
    #   require 'json'
    #   require 'uri'
  
    #   uri = URI('https://trefle.io/api/plants/137119')
    #   params = { :token=> 'MlBBVkRPaEl4cnZmL2xYMFlpN1VPUT09' }
    #   uri.query = URI.encode_www_form(params)
  
    #   res = Net::HTTP.get_response(uri)
    #   puts res.body if res.is_a?(Net::HTTPSuccess)
    # end
  
    # def make_post_req_plant_usage
    #   require 'httparty'
    #   require 'json'
  
    #   route = 'https://api.plant.id/usage_info'
    #   body = {
    #     'key' => '50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov'
    #   }
    #   response = HTTParty.post(route, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    #   res = response.parsed_response
    #   p res
    # end
end