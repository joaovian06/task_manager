class Task < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates_presence_of :description
end
