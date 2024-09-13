class ResidentsController < ApplicationController
    def index
        @residents = Resident.all
    end
    
    def show
        @resident = Resident.find(params[:id])
        @courses = @resident.course_list
    end
end