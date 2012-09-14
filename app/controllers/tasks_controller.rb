class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @task = Task.order('RANDOM()').first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    if params[:id] == 'random'
      @task = Task.order('RANDOM()').first
      redirect_to @task
    else
      @task = Task.find(params[:id])
    end

  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.points ||= 0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  #Out of Scaffold
  def rate_up
    @task = Task.find(params[:id])
    @task.points += 5
    @task.update_attributes(params[:task])
    
    #return whitout render anything
    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end

  def rate_down
    @task = Task.find(params[:id])
    @task.points -= 5
    @task.update_attributes(params[:task])
    
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def random_task
    begin
      @task = Task.find(rand(Task.first.id..Task.last.id)) rescue "Item couldn't been randomized!"

    end
    respond_to do |format|
      format.html {redirect_to rand_task }
      format.json { rende :no_content }
    end
  end

  def rand_task
    @task = Task.new
    @task = Task.order('RANDOM()').first
    respond_to do |format|
      format.html { render :partial => "rand_task" }
    end
  end
end
    
    