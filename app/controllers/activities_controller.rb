class ActivitiesController < ApplicationController 

   get "/activities" do
    redirect_if_not_logged_in 
    @activities = Activity.all
    erb :'activities/index'
  end

  get "/activities/new" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    erb :'activities/new'
  end

  get "/activities/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @activity = Activity.find(params[:id])
    erb :'activities/edit'
  end

  post "/activities/:id" do
    redirect_if_not_logged_in 
    @activity = Activity.find(params[:id])
    unless Activity.valid_params?(params)
      redirect "/activities/#{@activity.id}/edit?error=invalid activity"
    end
    @activity.update(params.select{|k|k=="name" || k=="activity_id"})
    redirect "/activities/#{@activity.id}"
  end

  get "/activities/:id" do
    redirect_if_not_logged_in 
    @activity = Activity.find(params[:id])
    erb :'activities/show'
  end

  post "/activities" do
    redirect_if_not_logged_in 
    unless Activity.valid_params?(params)
      redirect "/activities/new?error=invalid activity"
    end
    Activity.create(params)
    redirect "/activities"
  end

end