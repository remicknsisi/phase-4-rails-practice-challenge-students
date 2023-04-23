class InstructorsController < ApplicationController

    def create
        instructor = Instructor.new(instructor_params)
        if instructor.valid?
            render json: instructor, status: :created
        else
            render json: {errors: instructor.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def index
        render json: Instructor.all, status: :ok
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(params)
            render json: instructor, status: :ok
        else
            render json: {errors: instructor.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: {error: "instructor not found"}, status: :not_found
        end
    end

    private 

    def instructor_params
        params.permit(:name)
    end

end
