require "rails_helper"

RSpec.describe Course, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  before(:each) do
    @jess = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
    @seth = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")

    @crime_scenes = Course.create!(name: "Crime Scenes 101")
    @finger = Course.create!(name: "Fingerprinting")
    @fight = Course.create!(name: "Fighting")

    @crime_scenes.residents << @jess
    @finger.residents << @jess
    @finger.residents << @seth
    @fight.residents << @seth

  end

  describe "instance methods" do
    it "can count residents enrolled in a course" do
      expect(@finger.count_residents).to eq(2)
      expect(@fight.count_residents).to eq(1)

    end
  end

end
