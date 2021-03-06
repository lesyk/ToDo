class TodolistsController < ApplicationController
  # GET /todolists
  # GET /todolists.json
  def index
    @todolists = Todolist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todolists }
    end
  end

  # GET /todolists/1
  # GET /todolists/1.json
  def show
    @todolist = Todolist.find(params[:id])
    
    edit

    respond_to do |format|
      format.js
    end
  end

  # GET /todolists/new
  # GET /todolists/new.json
  def new
    @list = List.find(params[:id])
    @todolist = @list.todolists.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todolist }
    end
  end

  # GET /todolists/1/edit
  def edit
    @todolist = Todolist.find(params[:id])
  end
  
  def create
     #if params[:commit]
       @list = List.find(params[:list_id])
        @todolist = @list.todolists.create(params[:todolist])


        respond_to do |format|
          format.js
      end
      #else
       # render :nothing => true
      #end
   end

  # PUT /todolists/1
  # PUT /todolists/1.json
  def update
    @todolist = Todolist.find(params[:id])
    @list = List.find(@todolist.list_id)
    
    if @todolist.compl != 1
      if params[:todolist][:compl] == '1'
        @todolist.update_attributes(:d_completed => Time.now)
      end
    end

    respond_to do |format|
      if @todolist.update_attributes(params[:todolist])
        format.html { redirect_to @todolist, notice: 'Todolist was successfully updated.' }
        format.json { head :ok }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.json
  def destroy
    @todolist = Todolist.find(params[:id])
    @list = List.find(@todolist.list_id)
    @todolist.destroy

    respond_to do |format|
      format.js
    end
  end
  
end
