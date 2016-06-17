class CreateActivities < ActiveRecord::Migration
   def change
    create_table :activities do |t|
      t.string :kind
      t.string :name
      t.string :adress
      t.string :notes
    end
  end
end
