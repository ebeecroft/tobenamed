class TcontainersController < ApplicationController
  # GET /tcontainers
  # GET /tcontainers.json
  def index
    @tcontainers = Tcontainer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tcontainers }
    end
  end

  # GET /tcontainers/1
  # GET /tcontainers/1.json
  def show
    @tcontainer = Tcontainer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tcontainer }
    end
  end

  # GET /tcontainers/new
  # GET /tcontainers/new.json
  def new
    @tcontainer = Tcontainer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tcontainer }
    end
  end

  # GET /tcontainers/1/edit
  def edit
    @tcontainer = Tcontainer.find(params[:id])
  end

  # POST /tcontainers
  # POST /tcontainers.json
  def create
    @tcontainer = Tcontainer.new(params[:tcontainer])

    respond_to do |format|
      if @tcontainer.save
        format.html { redirect_to @tcontainer, notice: 'Tcontainer was successfully created.' }
        format.json { render json: @tcontainer, status: :created, location: @tcontainer }
      else
        format.html { render action: "new" }
        format.json { render json: @tcontainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tcontainers/1
  # PUT /tcontainers/1.json
  def update
    @tcontainer = Tcontainer.find(params[:id])

    respond_to do |format|
      if @tcontainer.update_attributes(params[:tcontainer])
        format.html { redirect_to @tcontainer, notice: 'Tcontainer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tcontainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcontainers/1
  # DELETE /tcontainers/1.json
  def destroy
    @tcontainer = Tcontainer.find(params[:id])
    @tcontainer.destroy

    respond_to do |format|
      format.html { redirect_to tcontainers_url }
      format.json { head :no_content }
    end
  end
end
