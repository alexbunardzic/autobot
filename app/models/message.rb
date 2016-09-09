class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :categorized_message
end
