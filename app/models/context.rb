class Context < ActiveRecord::Base
  belongs_to :context_category
  has_many :intents
end
