class PetOwnersController < ApplicationController
  # GET /pet_owners
  # GET /pet_owners.json
  def index
    @pet_owners = PetOwner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pet_owners }
    end
  end

  # GET /pet_owners/1
  # GET /pet_owners/1.json
  def show
    @pet_owner = PetOwner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet_owner }
    end
  end

  # GET /pet_owners/new
  # GET /pet_owners/new.json
  def new
    @pet_owner = PetOwner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet_owner }
    end
  end

  # GET /pet_owners/1/edit
  def edit
    @pet_owner = PetOwner.find(params[:id])
  end

  # POST /pet_owners
  # POST /pet_owners.json
  def create
    @pet_owner = PetOwner.new(params[:pet_owner])

    respond_to do |format|
      if @pet_owner.save
        format.html { redirect_to @pet_owner, notice: 'Pet owner was successfully created.' }
        format.json { render json: @pet_owner, status: :created, location: @pet_owner }
      else
        format.html { render action: "new" }
        format.json { render json: @pet_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pet_owners/1
  # PUT /pet_owners/1.json
  def update
    @pet_owner = PetOwner.find(params[:id])

    respond_to do |format|
      if @pet_owner.update_attributes(params[:pet_owner])
        format.html { redirect_to @pet_owner, notice: 'Pet owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_owners/1
  # DELETE /pet_owners/1.json
  def destroy
    @pet_owner = PetOwner.find(params[:id])
    @pet_owner.destroy

    respond_to do |format|
      format.html { redirect_to pet_owners_url }
      format.json { head :no_content }
    end
  end
end
