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

  def list
     if current_user && current_user.admin?
        @petowners = Petowner.all
     else
        render "public/404"
     end
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
    if @pet.nil?
       raise "You are a really dumb user"
    end
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

     #Discovers information about the current_user
     @user = User.find_by_vname(current_user.vname)
     @pouch = Pouch.find_by_id(@user.id)
     @petowner = @user.petowners.new(params[:petowner])
     @pet = Pet.find(@petowner.pet_id)
     free_pet = false

     #Checks to see if the user doesn't own a single pet
     if current_user.petowners.empty?
        #Only allow starter pets to be selected
        if !@petowner.pet.starter?
           redirect_to pets_path
           return
        end
        free_pet = true
     end

     #Decrement the cost of the owned pet from the user's pouch if not the first pet
     if free_pet == false
        if @petowner.pet.cost > @pouch.amount
           redirect_to pets_url
           return
        else
           @pouch.amount -= @petowner.pet.cost #This should be setting change based on user's money - items price
        end
     end

     #Sets the stats of the owned pet based on the pet's stats
     @petowner.level = @pet.level
     @petowner.hp = @pet.hp
     @petowner.atk = @pet.atk
     @petowner.def = @pet.def
     @petowner.spd = @pet.spd
     @petowner.hp_max = @pet.hp
     @petowner.adopted_on = Date.today

     #Saves the new owned pet
     if @petowner.save
        @pouch.save
#        format.html { redirect_to @petowner, notice: 'Petowner was successfully created.' }
#        format.json { render json: @petowner, status: :created, location: @petowner }
#maintopic_subtopics_url
        redirect_to user_petowners_path(@user) #current_user_petowners_url
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
