class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :ideas, dependent: :nullify

  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea


  def full_name
    "#{first_name} #{last_name}".strip
  end



end
