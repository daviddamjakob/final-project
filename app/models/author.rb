# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord
    
    # validations
    validates :name, :presence => true
    
    # direct associations
    has_many :articles, :dependent => :nullify
    
end
