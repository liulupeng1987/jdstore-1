class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :reviews, dependent: :destroy              #商品留言关系，dependent: :destroy表示联级删除

  def admin?
    (role == "admin")
  end
end
