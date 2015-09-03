class CreateReplies < ActiveRecord::Migration
  def change
  	create_table :replies do |t|
  		t.string :text
  	end
  end
end
