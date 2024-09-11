class Resident < ApplicationRecord
    validates :name, :age, :occupation, presence: true
    has_many :resident_courses
    has_many :courses, through: :resident_courses
end
