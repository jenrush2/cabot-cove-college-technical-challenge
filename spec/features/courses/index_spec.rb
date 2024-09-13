require "rails_helper"

RSpec.describe Course, type: :features do
    before(:each) do
        @jess = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
        @seth = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")

        @crime_scenes = Course.create!(name: "Crime Scenes 101")
        @finger = Course.create!(name: "Fingerprinting")
        @fight = Course.create!(name: "Fighting")
        @hide = Course.create!(name: "Hiding")
        
        @crime_scenes.residents << @jess
        @finger.residents << @jess
        @finger.residents << @seth
        @fight.residents << @seth
    end

    describe "courses index page" do
        it "lists the courses and residents enrolled" do
            visit "/courses"

            expect(page).to have_content("Crime Scenes 101: 1")
            expect(page).to have_content("Fingerprinting: 2")
            expect(page).to have_content("Fighting: 1")
            expect(page).to have_content("Hiding: 0")

        end
    end

end