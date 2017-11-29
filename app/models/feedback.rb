class Feedback < ApplicationRecord
  belongs_to :ratable_type, polymorphic: true
end
