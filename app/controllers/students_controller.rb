class StudentsController < ApplicationController

    def create
        instructor = Instructor.find_by(id: params[:instructor_id])
        student = instructor.students.create(student_params)
        if student.valid?
            render json: student, status: :created
        else
            render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def index
        render json: Student.all, status: :ok
    end

    def update
        instructor = Instructor.find_by(id: params[:instructor_id])
        student = instructor.students.find_by(id: params[:id])
        student.update(params)
        if student.valid?
            render json: :student, status: :ok
        else
            render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age)
    end

end
