class Like < ActiveRecord::Base
  validates :idea_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :idea
  
end
