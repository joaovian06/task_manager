class Task < ApplicationRecord
    enum status: {
        pending: 0,
        in_progress: 1,
        canceled: 2,
        accomplished: 3
    }
    
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :status, presence: true
end
