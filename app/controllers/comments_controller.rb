require 'digest/md5'

class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    @row_counter = 0
    @col_counter = 99

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
    ayah = AYAH::Integration.new(Rails.configuration.PUBLISHER_KEY, Rails.configuration.SCORING_KEY)
    #@publisher_html = ayah.get_publisher_html.html_safe
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  ## GET /comments/1/edit
  #def edit
  #  @comment = Comment.find(params[:id])
  #end

  # POST /comments
  # POST /comments.json
  def create

    #session_secret = params['session_secret'] # in this case, using Rails
    #ayah = AYAH::Integration.new(Rails.configuration.PUBLISHER_KEY, Rails.configuration.SCORING_KEY)
    #unless ayah.score_result(session_secret, request.remote_ip)
    #  respond_to do |format|
    #    format.html { render action: "new" }
    #    format.json { render json: @comment.errors, status: :unprocessable_entity }
    #  end
    #end
    @comment = Comment.new(params[:comment].permit(:name, :email, :guess, :comment))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  ## PUT /comments/1
  ## PUT /comments/1.json
  #def update
  #  @comment = Comment.find(params[:id])
  #
  #  respond_to do |format|
  #    if @comment.update_attributes(params[:comment])
  #      format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @comment.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /comments/1
  ## DELETE /comments/1.json
  #def destroy
  #  @comment = Comment.find(params[:id])
  #  @comment.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to comments_url }
  #    format.json { head :no_content }
  #  end
  #end
end
