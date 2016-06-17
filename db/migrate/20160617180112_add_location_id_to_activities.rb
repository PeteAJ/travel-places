class AddLocationIdToActivities < ActiveRecord::Migration
  def change
     add_column :activites, :location_id, :integer
  end
end
