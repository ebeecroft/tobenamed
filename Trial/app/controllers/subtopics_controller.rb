class SubtopicsController < ApplicationController
  # GET /subtopics
  # GET /subtopics.json
  #before_filter :load_forum
  before_filter :load_maintopic, :only =>[:create, :index, :new]
  before_filter :valid_maintopic_connections, :except =>[:create, :index, :new]
  def index
    @subtopics = @maintopic.subtopics.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subtopics }
    end
  end

  # GET /subtopics/1
  # GET /subtopics/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subtopic }
    end
  end

  # GET /subtopics/new
  # GET /subtopics/new.json
  def new
#@user = User.find_by_vname(params[:user_id])
#    @maintopic = @user.maintopics.build
     @user = User.find_by_vname(params[:user_id])
     @subtopic = @maintopic.subtopics.build
     @subtopic.user_id = @user.id
  end

  # GET /subtopics/1/edit
  def edit
  end

  # POST /subtopics
  # POST /subtopics.json
  def create
     @subtopic = @maintopic.subtopics.new(params[:subtopic])
     if !(@subtopic.maintopic_id == @maintopic.id) #Prevents a subtopic from being assigned data to a maintopic that doesn't match
       redirect_to @maintopic
       return
     end
     @subtopic.save
     #if @subtopic.save
     #   redirect_to @maintopic.subtopic
     #else
     #   render "new";
     #end
     redirect_to maintopic_subtopics_url
  end

  # PUT /subtopics/1
  # PUT /subtopics/1.json
  def update
    respond_to do |format|
      if @subtopic.update_attributes(params[:subtopic])
        format.html { redirect_to maintopic_subtopic_path([@maintopic]), notice: 'Subtopic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subtopic.errors, status: :unprocessable_entity }
      end
    end
  end
#raise
  # DELETE /subtopics/1
  # DELETE /subtopics/1.json
  def destroy
    @subtopic.destroy
    
    respond_to do |format|
      format.html { redirect_to maintopic_subtopics_url }
      format.json { head :no_content }
    end
  end
   private
      def load_forum
         if (params[:id])
            @subtopic = Subtopic.find(params[:id])
            @maintopic = @subtopic.maintopic #rescue redirect_to(maintopics_path)
         elsif (params[:forum_id])
            @maintopic = Maintopic.find(params[:maintopic_id])
         else
            #redirect_to(maintopics_path)
            #echo "I am here."
         end
      end
      def valid_maintopic_connections
         @maintopic = Maintopic.find(params[:maintopic_id])
         @subtopic = Subtopic.find(params[:id])
         if !(@subtopic.maintopic_id == @maintopic.id) #Prevents a subtopic from being assigned data to a maintopic that doesn't match
            redirect_to @maintopic
            return
         end
      end
      def load_maintopic
         @maintopic = Maintopic.find(params[:maintopic_id])
      end
end
