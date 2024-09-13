class Resident < ApplicationRecord
    validates :name, :age, :occupation, presence: true
    has_many :resident_courses
    has_many :courses, through: :resident_courses

    def course_list
        courses
    end

    def self.average_age
        average(:age)
    end

    def self.alphabetical
        order(name: :desc)
    end
end
