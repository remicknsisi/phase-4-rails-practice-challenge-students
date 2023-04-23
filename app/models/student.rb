class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true
    validates :major, presence: true
    validates :age, less_than_or_equal_to: 18
end
