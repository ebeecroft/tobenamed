class PouchesController < ApplicationController
  # GET /pouches
  # GET /pouches.json
  def index
     if current_user && current_user.admin?
        @pouches = Pouch.all
     else
        render "public/404"
     end
  end

  # GET /pouches/1
  # GET /pouches/1.json
  def show
    @pouch = Pouch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pouch }
    end
  end

  # GET /pouches/new
  # GET /pouches/new.json
  def new
    @pouch = Pouch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pouch }
    end
  end

  # GET /pouches/1/edit
  def edit
    @pouch = Pouch.find(params[:id])
  end

  # POST /pouches
  # POST /pouches.json
  def create
    @pouch = Pouch.new(params[:pouch])

    respond_to do |format|
      if @pouch.save
        format.html { redirect_to @pouch, notice: 'Pouch was successfully created.' }
        format.json { render json: @pouch, status: :created, location: @pouch }
      else
        format.html { render action: "new" }
        format.json { render json: @pouch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pouches/1
  # PUT /pouches/1.json
  def update
    @pouch = Pouch.find(params[:id])

    respond_to do |format|
      if @pouch.update_attributes(params[:pouch])
        format.html { redirect_to @pouch, notice: 'Pouch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pouch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pouches/1
  # DELETE /pouches/1.json
  def destroy
    @pouch = Pouch.find(params[:id])
    @pouch.destroy

    respond_to do |format|
      format.html { redirect_to pouches_url }
      format.json { head :no_content }
    end
  end
end
