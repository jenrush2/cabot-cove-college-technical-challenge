class ResidentsController < ApplicationController
    def index
        @residents = Resident.all
        @resident_average_age = Resident.average_age
    end
    
    def show
        @resident = Resident.find(params[:id])
        @courses = @resident.course_list
    end
end