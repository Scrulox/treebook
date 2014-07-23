class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profiel_name

  
validates :first_name, presence: true

validates :last_name, presence: true

validates :profile_name, presence: true,
                         uniqueness: true,
                         format: {
                          with: /a-zA-Z0-9_-/,
                          message: "Must be formatted corectly",

                         }




  has_many :statuses


  # attr_accessible :title, :body

  def full_name
    first_name + " " + last_name
  end


end
