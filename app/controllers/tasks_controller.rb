class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else
            render 'new'
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to task_path
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(rask_params)
            redirect_to task_path(@task)
        else
            render 'edit'
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :details, :completed)
    end

end
