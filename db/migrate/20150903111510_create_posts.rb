class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :vote_count, default:0
  		t.integer :comments_count, default:0
  		t.string :title
  		t.string :url
  		t.string :user_id
  		t.timestamps null:false
  	end
  end
end
