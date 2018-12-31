# == Schema Information
#
# Table name: feedbacks
#
#  id          :integer          not null, primary key
#  topic       :text
#  pagination  :text
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :text
#

class Feedback < ApplicationRecord
    
    # validations
    validates :description, :presence => true
    
    # direct associations
    belongs_to :user
    
end
