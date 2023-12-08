# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  contact_number         :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord

  has_one :cart, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :orders, dependent: :destroy

  def create_cart
    build_cart(shipping_fee: 0, taxes: 0).save
    cart

  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def vendor?
          self.role == 'vendor' # Assuming you have a 'role' attribute
  end
end
