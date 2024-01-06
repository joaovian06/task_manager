class TasksController < ApplicationController
    def index
        @tasks = Task.all
        render json: @tasks
    end

    def show
        @task = Task.find_by(params[:id])

        if @task.present?
            render json: @task
        else
            render :json, status: :not_found
        end
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            render json: @task, status: :created
        else
            render :json, status: :unprocessable_entity
        end
    end

    def update
        @task = Task.find_by(params[:id])

        @task.update(task_params)
        if @task.save
            render json: @task, status: :ok
        else
            render :json, status: :unprocessable_entity
        end
    end

    def destroy
        @task = Task.find_by(params[:id])

        if @task.destroy
            render json: @tasks, status: :ok
        end
    end

    def task_params
        params.require(:task).permit([:name, :description, :status])
    end
end
