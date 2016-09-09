class CategorizedMessage < ActiveRecord::Base
  belongs_to :intent
  has_many :messages
end
