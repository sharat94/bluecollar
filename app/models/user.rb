class User < ActiveRecord::Base
  belongs_to :city
  belongs_to :locality
  has_many :tickets
  has_many :user_services
  has_many :services , through: :user_services
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
         	return true if self.role == "admin"
  end
      def is_worker?
          return true if self.role == "worker"
      end
end
