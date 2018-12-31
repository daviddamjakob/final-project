# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  link           :string
#  caption        :text
#  reading_time   :integer
#  user_id        :integer
#  publisher_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tc_image       :string
#  tc_card        :string
#  tc_title       :text
#  tc_description :text
#  author_id      :integer
#  hashtags_input :text
#  private_status :boolean
#  test           :string
#

class Article < ApplicationRecord
    
    # validations
    validates :user_id, :presence => true
    validates :link, :presence => true
    validates :link, :format => URI::regexp(%w(http https))
    
    # direct associations
    belongs_to :user
    has_many :descriptions, :dependent => :destroy
    has_many :ratings, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    has_many :bookmarks, :dependent => :destroy
    has_many :favorites, :dependent => :destroy
    belongs_to :author, :required => false
    belongs_to :publisher, :required => false
    
    # indirect associations
    has_many :future_reads, :through => :bookmarks, :source => :user
    has_many :fans, :through => :favorites, :source => :user
    has_many :user_ratings, :through => :ratings, :source => :user
    has_many :tags, :through => :descriptions, :source => :hashtag
    
    
end


