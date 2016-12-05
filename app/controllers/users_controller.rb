class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except=>[:show]

  # GET /users
  # GET /users.json
  def index

    @users = User.all
    @posts = Present.where(created_by: current_user)
    @gets = Get.where(created_by: current_user)
    @result = user_signed_in?
    @userid = current_user

     if @result
        @following_user = current_user.followees(@users)
        @follower_user = current_user.followers(@users)
       require 'date'
       @datatime = DateTime.now.strftime("%Y%m%d")
       @user = User.find_by(params[:id])


    else
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.all
    @user = User.find(params[:id])
    @userid = current_user
    @result = user_signed_in?
    require 'date'
    @datatime = DateTime.now.strftime("%Y%m%d")

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    redirect_to action: 'show'
  end
  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user) 
    redirect_to action: 'show'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end

end
