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
    
    def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
  
    %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
    
end


