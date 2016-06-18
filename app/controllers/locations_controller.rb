class LocationsController < ApplicationController 


  get "/locations" do
    redirect_if_not_logged_in
    @locations = Location.all
    erb :'golf_locations/index'
  end

  get "/locations/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'golf_locations/new'
  end

  get "/locations/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @bag = Location.find(params[:id])
    erb :'golf_locations/edit'
  end

  post "/locations/:id" do
    redirect_if_not_logged_in
    @bag = Location.find(params[:id])
    unless Location.valid_params?(params)
      redirect "/locations/#{@bag.id}/edit?error=invalid golf bag"
    end
    @bag.update(params.select{|k|k=="name" || k=="capacity"})
    redirect "/locations/#{@bag.id}"
  end

  get "/locations/:id" do
    redirect_if_not_logged_in
    @bag = Location.find(params[:id])
    erb :'golf_locations/show'
  end

  post "/locations" do
    redirect_if_not_logged_in

    unless Location.valid_params?(params)
      redirect "/locations/new?error=invalid golf bag"
    end
    Location.create(params)
    redirect "/locations"
  end
end