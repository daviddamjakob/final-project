# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ApplicationRecord
    
    # validations
    validates :user_id, :presence => true
    validates :article_id, :presence => true
    
    # direct associations
    belongs_to :user
    belongs_to :article
    
end
