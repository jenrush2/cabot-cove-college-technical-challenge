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
    
    describe "resident index page" do
        it "lists resident attributes" do
            visit "/residents"

            expect(page).to have_content("Name: Jessica Fletcher")
            expect(page).to have_content("Age: 65")
            expect(page).to have_content("Occupation: Mystery writer")
            expect(page).to have_content("Name: Dr. Seth Hazlitt")
            expect(page).to have_content("Age: 70")
            expect(page).to have_content("Occupation: Town Doctor")
          
        end

        it "gives the average age of residents" do
            visit "/residents"
            
            expect(page).to have_content("Average Age: 67.5")
        end
    
    end
end