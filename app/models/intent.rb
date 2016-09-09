class Intent < ActiveRecord::Base
  belongs_to :context
  has_many :answers
  has_many :categorized_messages
end
