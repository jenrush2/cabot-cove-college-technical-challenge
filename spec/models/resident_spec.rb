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
    it "can list courses for a resident" do
      expect(@jess.course_list).to eq([@crime_scenes, @finger])
    end
  end

end
