class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :collaborations, dependent: :destroy
  has_many :assignments, through: :collaborations
  has_many :tasks, through: :assignments
  has_many :events, through: :collaborations
  has_many :messages, dependent: :destroy
  has_many :notes, dependent: :destroy
end
