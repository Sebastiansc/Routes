class Comment < ActiveRecord::Base
  belongs_to :topic, polymorphic: true
  belongs_to :author
end
