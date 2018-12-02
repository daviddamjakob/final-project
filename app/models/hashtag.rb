# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ApplicationRecord
    
    # validations
    validates :tag, :presence => true
    validates :tag, :uniqueness => { :message => "this hashtag already exists" }
    
    # direct associations
    has_many :descriptions, :dependent => :destroy
    
end
