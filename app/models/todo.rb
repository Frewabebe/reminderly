class Todo < ActiveRecord::Base
  validates :body, :author, presence: true
end
