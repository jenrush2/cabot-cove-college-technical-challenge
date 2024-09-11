require "rails_helper"

RSpec.describe Resident, type: :features do
    before(:each) do
        Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
        Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
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
            save_and_open_page
        end
    
    end
end