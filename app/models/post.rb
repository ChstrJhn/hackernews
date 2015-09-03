class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  has_many :voters, through: :votes, class_name: "User", source: :user

  def vote(user)
    if self.voters.include?(user)
      return false
    else
      self.votes.create(user_id: user.id)
      return true
    end
  end

  def count
  	self.votes.size
  end

end
