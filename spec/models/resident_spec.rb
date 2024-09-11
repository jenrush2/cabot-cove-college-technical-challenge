require "rails_helper"

RSpec.describe Resident, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe "relationships" do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  # before(:each) do
  #   Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
  #   Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
  # end

end
