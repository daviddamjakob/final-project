# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  score      :integer
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
    
    # validations
    validates :user_id, :presence => true
    validates :score, :numericality => { :less_than_or_equal_to => 10, :greater_than_or_equal_to => 0 }
    validates :score, :presence => true
    validates :article_id, :presence => true
    
    # direct associations
    belongs_to :user
    belongs_to :article
    
end
