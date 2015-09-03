class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :parent, foreign_key: :parent_id, class_name: "Comment"
  has_many :children, foreign_key: :parent_id, class_name: "Comment", table_name: :comments
end
