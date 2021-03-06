class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    #GET with blank form 
    def new
        @task = Task.new
    end

    #POST to save data from form
    def create 
        @task = Task.new(task_params)
        if @task.save
            # /TODO: add flash messages whit succes

            redirect_to tasks_path
        else
            # /TODO: add flash messages whit errors
            render :new
        end
    end

    def destroy
        @task=Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end
    private
    def task_params
        params.require(:task).permit(:title, :description)
    end
end
