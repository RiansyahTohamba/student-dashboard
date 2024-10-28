class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { lecturer: 0, head_lecturer: 1}
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  has_many :courses
  
  def can_view_all_courses?
    head_lecturer?
  end
end
