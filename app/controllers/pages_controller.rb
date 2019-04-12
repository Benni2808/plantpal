class PagesController < ApplicationController
  before_action :set_user

  def home
    if @user
      redirect_to dashboard_path, notice: 'Welcome to your dashboard'
    end
  end

  def dashboard
    if @user.photo.attached?
      @user_photo = polymorphic_url @user.photo
    else
      @user_photo = '/assets/default_user.jpg'
    end
    @plants = @user.plants

    # make_post_req_trefle
    puts 'call plant.id api'
    make_post_req_plant
  end

  private
  def set_user
    @user = current_user
  end

  def make_post_req 
    require 'net/http'
    require 'json'
    begin
        uri = URI('https://api.plant.id/check_identifications')
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          req = Net::HTTP::Post.new(uri, :initheader => {
            'Content-Type' =>'application/json'
          })
          req.body = {
            "key" => "50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov",
            "ids" => [130772]
          }.to_json          
          http.request(req)
        end
        if res
          puts "response #{res.body}"
          puts JSON.parse(res.body)
        end
    rescue => e
        puts "failed #{e}"
    end
    response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    puts response.body, response.code, response.message, response.headers.inspect
    route = 'https://api.plant.id/check_identifications'
    body = {
      'key' => '50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov',
      'ids' => [130772]
    }
    response = HTTParty.post(route, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
  end

  def make_post_req_trefle
    require 'net/http'
    require 'json'
    require 'uri'

    uri = URI('https://trefle.io/api/plants/137119')
    params = { :token=> 'MlBBVkRPaEl4cnZmL2xYMFlpN1VPUT09' }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end

  def make_post_req_plant
    require 'httparty'
    require 'json'

    route = 'https://api.plant.id/usage_info'
    body = {
      'key' => '50vulBj9jUabpDEk3edQYQyTUj7vr694L35NkUSqkgkFDByUov'
    }
    response = HTTParty.post(route, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    res = response.parsed_response
    p res
  end
end
