class Task < ActiveRecord::Base
  enum interval: [ :weekly, :monthly, :yearly ]
  validates :title, presence: true

end
