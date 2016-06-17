class Activity < ActiveRecord::Base
  belongs_to :location

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:manufacturer].empty?
  end
end
