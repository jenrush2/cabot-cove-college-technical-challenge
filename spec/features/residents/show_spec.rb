require "rails_helper"

RSpec.describe Resident, type: :features do
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

    describe "resident show page" do
        it "lists resident courses" do
            visit "/residents/#{@jess.id}"
            
            expect(page).to have_content("#{@jess.name}")
            expect(page).to have_content("Courses:")
            expect(page).to have_content("Crime Scenes 101")
            expect(page).to have_content("Fingerprinting")
            expect(page).to_not have_content("#{@seth.name}") 
            expect(page).to_not have_content("Fighting") 


        end
    end
end