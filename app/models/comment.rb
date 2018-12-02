# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    
    # validations
    validates :user_id, :presence => true
    validates :body, :presence => true
    validates :article_id, :presence => true
    
    # direct associations
    belongs_to :user
    belongs_to :article
    
end
