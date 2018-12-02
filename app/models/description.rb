# == Schema Information
#
# Table name: descriptions
#
#  id         :integer          not null, primary key
#  hashtag_id :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Description < ApplicationRecord
    
    # validations
    validates :hashtag_id, :presence => true
    validates :article_id, :presence => true
    
    # direct associations
    belongs_to :article
    belongs_to :hashtag
    
end
