# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookmark < ApplicationRecord
    
    # validations
    validates :user_id, :presence => true
    validates :article_id, :presence => true
    
    # direct associations
    belongs_to :user
    belongs_to :article
    
end
