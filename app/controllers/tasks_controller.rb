class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = 'Taskが正常に投稿されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskが投稿されませんでした'
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskは更新されませんでいた'
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = 'Taskは正常に削除されました'
        redirect_to task_url
    end
        
    
    private
    
    # Strong Parameter  
    def task_params
        params.require(:task).permit(:content)
    end
end



