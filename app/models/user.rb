# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  bio                    :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fb_account             :string
#  twitter_account        :string
#  linkedin_account       :string
#  website_url            :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # validations
  validates :username, :presence => true
  validates :username, :uniqueness => true
  
  # direct associations
  has_many :articles, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  
  # indirect associations
  has_many :bookmarked_articles, :through => :bookmarks, :source => :article
  has_many :favorite_articles, :through => :favorites, :source => :article
  has_many :rated_articles, :through => :ratings, :source => :article
  
end
