class PetownersController < ApplicationController
  # GET /petowners
  # GET /petowners.json
   def create_adoption
      params[:pet_id]
      new_petowner= Petowner.new
      new_petowner.pet_id = params[:pet_id]
      new_petowner.user_id = current_user.id
      new_petowner.save


      redirect_to root_url
   end

  def index
#    @subtopics = @maintopic.subtopics.all
    @user = User.find_by_vname(params[:user_id])
    @petowners = @user.petowners.all
#    @petowners = Petowner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @petowners }
    end
  end

  # GET /petowners/1
  # GET /petowners/1.json
  def show
    @user = User.find_by_vname(params[:user_id])
    @petowner = Petowner.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @petowner }
    end
  end

  # GET /petowners/new
  # GET /petowners/new.json
  def new
#    @subtopic = @maintopic.subtopics.build
#    @petowner = Petowner.new
    @user = User.find_by_vname(params[:user_id])
    @pet = Pet.find_by_id(params[:pet_id])
    @petowner = @user.petowners.build
    @petowner.pet_id = @pet.id
    @petowner.level = @pet.level
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @petowner }
    end
  end

  # GET /petowners/1/edit
  def edit
    @user = User.find_by_vname(params[:user_id])
    @petowner = Petowner.find(params[:id])
  end

  # POST /petowners
  # POST /petowners.json
  def create
     puts '***********************************************************************'
     puts params[:pick_pet]
     #raise "I am here"
     @user = User.find_by_vname(current_user.vname)
     @pet = Pet.find_by_id(params[:petowner][:pet_id])
#     raise "Hello"
#     @petowner = @user.petowners.build
#     @petowner.pet_id = params[:pet_id]
     @petowner = @user.petowners.new(params[:petowner])
     @petowner.hp = @pet.hp
#     @petowner.level = @pet.level
#     @petowner = Petowner.new(params[:petowner])
     #@pet = Pet.find(params[:pet][:pet_id])
     #@petowner.pet = @pet
      if @petowner.save
#        format.html { redirect_to @petowner, notice: 'Petowner was successfully created.' }
#        format.json { render json: @petowner, status: :created, location: @petowner }
#maintopic_subtopics_url
         redirect_to @user #current_user_petowners_url
      else
         render "new"
      end
  end

  # PUT /petowners/1
  # PUT /petowners/1.json
  def update
#         @maintopic = Maintopic.find(params[:maintopic_id])
#         @subtopic = Subtopic.find(params[:id])
    @user = User.find_by_vname(params[:user_id])
    @petowner = Petowner.find(params[:id])

      if @petowner.update_attributes(params[:petowner])
        redirect_to user_petowners_path(@user), notice: 'Petowner was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  # DELETE /petowners/1
  # DELETE /petowners/1.json
  def destroy
    @user = User.find_by_vname(params[:user_id])
    @petowner = Petowner.find(params[:id])
    @petowner.destroy

    respond_to do |format|
      format.html { redirect_to user_petowners_url }
      format.json { head :no_content }
    end
  end
end
