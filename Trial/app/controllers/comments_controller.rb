class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  #include SessionsHelper
  def index
     @user = User.find_by_vname(params[:user_id])
     @comments = @user.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
#    @comment = Comment.new(params[:comment])
#     @petowner = Petowner.find_by_id(params[:petowner_id])
#     @equip = @petowner.equips.new(params[:equip])

#     @user = User.find_by_vname(params[:user_id])

#raise "What now?"
#     puts 'inside current_user'

     @user = User.find_by_vname(params[:user_id])
     @comment = @user.comments.new(params[:comment])
     @comment.author_id = current_user.id

     if @comment.save
        raise "I am saving the comment"
     else
        raise "I couldn't save"
     end
     redirect_to @user

#     @comment.inspect
#     raise "Am here"
#      @current_user.inspect
#      raise "I am here"
#     @comment.author_id = current_user.id
#     raise "User_id foreign key appears to be overwritten"
#     raise "What am I?"
#     @petowner = Petowner.find_by_id(params[:petowner_id])
#     @equip = @petowner.equips.new(params[:equip])
#     if @comment.message.empty?
#        flash[:failure] = "Message failed"
#     else
#        if @comment.save
#        end
#     end

#     redirect_to @user

#     if @user.tag.name.empty?
#         flash[:failure] = "Tag failed."
#      else
         #if tagging_tag
#         if @tagging.save
            #should redirect to bookmark.id upon successful creation of a tagging and creates a tag in database

#         end
#     end
#     redirect_to @blog

#      if @equip.save
#        redirect_to petowner_equips_path(@petowner)
#      else
#        render "new"
#      end
#  end

  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @user = User.find_by_vname(params[:user_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end
end
