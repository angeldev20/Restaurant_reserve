class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    enum role: [:user, :owner, :admin]
    after_initialize :set_default_role, :if => :new_record?
    validates_confirmation_of :password
    has_many :reservations
    def set_default_role
      self.role ||= :user
    end
    has_many :restaurants
  
  end
  