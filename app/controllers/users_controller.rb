class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except=>[:show]

  # GET /users
  # GET /users.json
  def index
    @collection = Collection.new

    @mygets = Get.where(created_by: current_user)
    days = (Date.today.beginning_of_month..Date.today).to_a
    @mygets_days = days.map { |item| @mygets.where(:created_at => item.beginning_of_day..item.end_of_day) }
    @mygets_days_all = @mygets_days.last.map(&:price).reduce(:+)
    @mygets_days_all_data = @mygets_days.last.map {|str| str.created_at.strftime('%Y年%m月%d日')}

    if @mygets_days[-2].nil?
      @mygets_days_all_2 = []
      @mygets_days_all_data_2 = []
    else
    @mygets_days_all_2 = @mygets_days[-2].map(&:price).reduce(:+)
    @mygets_days_all_data_2 = @mygets_days[-2].map {|str| str.created_at.strftime('%Y年%m月%d日')}
    end

    if @mygets_days[-3].nil?
      @mygets_days_all_3 = []
      @mygets_days_all_data_3 = []
    else
    @mygets_days_all_3 = @mygets_days[-3].map(&:price).reduce(:+)
    @mygets_days_all_data_3 = @mygets_days[-3].map {|str| str.created_at.strftime('%Y年%m月%d日')}
    end

    if @mygets_days[-4].nil?
      @mygets_days_all_4 = []
      @mygets_days_all_data_4 = []
    else
    @mygets_days_all_4 = @mygets_days[-4].map(&:price).reduce(:+)
    @mygets_days_all_data_4 = @mygets_days[-4].map {|str| str.created_at.strftime('%Y年%m月%d日')}
    end

    @mygets_all_price_data_chart = [{"name":"購入金額","data":{"#{@mygets_days_all_data_4.last}":@mygets_days_all_4,"#{@mygets_days_all_data_3.last}":@mygets_days_all_3,"#{@mygets_days_all_data_2.last}":@mygets_days_all_2,"#{@mygets_days_all_data.last}":@mygets_days_all}}]
    

    @mygets_price = @mygets.map  { |str| str.price }
    @mygets_all_price = @mygets_price.reduce(:+)
    @mygets_all_price_money = @mygets_all_price.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')

    @users = User.all
    @posts = Present.where(created_by: current_user)
    Collectionrelation.all 
    @gets = Get.where(created_by: current_user)
    @result = user_signed_in?
    @userid = current_user

    @get_my_dislke =  []

    current_user.find_disliked_items do  |dislike|

      @get_my_dislke.push(dislike.id)

    end


    @get_eating = Get.where(:id => @get_my_dislke, :get_cat => "eating")
    @get_shoping = Get.where(:id => @get_my_dislke, :get_cat => "shoping")

     if @result

    @mydislike = current_user.find_disliked_items.map { | str| str.id }
    @mydislike_eating = Get.where(:id => @mydislike , :get_cat =>"eating" )
    @mydislike_shoping = Get.where(:id => @mydislike , :get_cat =>"shoping" )


    @mycollection = Collection.where(created_by: current_user.id )
    @mycollection_name = @mycollection.map(&:collection_name)

        @following_user = current_user.followees(@users)
        @follower_user = current_user.followers(@users)
        @myfollowing_user_following = []

    @following_user.each do |aa |
      aa.followees(@users).each do |vv|
        @myfollowing_user_following.push(vv.id)
      end
    end
        @myfollowing_user_following.flatten!
        @myfollowing_user_following.shuffle!
        @befriends = User.find(@myfollowing_user_following.uniq)

       require 'date'
       @datatime = DateTime.now.strftime("%Y%m%d")
       @user = User.find_by(params[:id])

    else
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @collection = Collection.new


    @users = User.all
    @user = User.friendly.find(params[:id])
    @userid = current_user
    @result = user_signed_in?
    require 'date'
    @datatime = DateTime.now.strftime("%Y%m%d")


    @mycollection = Collection.where(created_by: @user )
    @mycollection_name = @mycollection.map(&:collection_name)


    @mydislike = @user.find_disliked_items.map { | str| str.id }
    @mydislike_eating = Get.where(:id => @mydislike , :get_cat =>"eating" )
    @mydislike_shoping = Get.where(:id => @mydislike , :get_cat =>"shoping" )

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
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
@userid = current_user

    @follow_status = {'status' => true}
    @user = User.friendly.find(params[:id])
    puts @userid.follows?(@user)
    if @userid.follows?(@user)
    current_user.unfollow!(@user)
    else
    current_user.follow!(@user)       
    end
    
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
       @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end

end
