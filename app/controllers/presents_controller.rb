class PresentsController < ApplicationController
  before_action :set_present, only: [:show, :edit, :update, :destroy, :like, :dislike, :unvote]
  before_action do
    RecordWithOperator.operator = current_user
  end

  # GET /presents
  # GET /presents.json
  def index

    @presents = Present.all

    @users = User.all
    @user = User.find_by(params[:id])

    @gets = Get.all

    @result = user_signed_in?
    @userid = current_user

    @posts_age_0_3 = Present.where(:youage => 1..3)
    @posts_age_3_6 = Present.where(:youage => 3..6)
    @posts_age_6_12 = Present.where(:youage => 6..12)
    @posts_age_12_18 = Present.where(:youage => 12..18)
    @posts_age_18_21 = Present.where(:youage => 18..21)

    @posts_age_10s = Present.where(:youage => 10..19)
    @posts_age_20s = Present.where(:youage => 20..29)
    @posts_age_30s = Present.where(:youage => 30..39)
    @posts_age_40s = Present.where(:youage => 40..49)
    @posts_age_50s = Present.where(:youage => 50..59)
    @posts_age_60s = Present.where(:youage => 60..69)
    @posts_age_70s80s90s = Present.where(:youage => 70..99)


    if @result
    @following = current_user.followees(@users)
    @following_id = @following.map { |str| str.id }
    @following_id.push(@userid)
    @following_posts = Present.where(created_by: @following_id)
    @following_posts_get = Get.where(created_by: @following_id)

    @posts = Present.where(created_by: current_user)

    end
    require 'date'
    
    @datatime = DateTime.now.strftime("%Y%m%d")
    @datatime_md = DateTime.now.strftime("%m%d")


    @schedule_event = {
      "0101" => "お正月",
      "1125" => "今日は何の日でもありません。",
      "1126" => "今日は何の日でもありません。",
      "1127" => "今日は何の日でもありません。",
      "1128" => "今日は何の日でもありません。",
      "1129" => "今日は何の日でもありません。",
      "1130" => "今日は何の日でもありません。",
      "1201" => "今日は何の日でもありません。",
      "1202" => "今日は何の日でもありません。",
      "1203" => "今日は何の日でもありません。",
      "1204" => "今日は何の日でもありません。",
      "1205" => "今日は何の日でもありません。"

    }

   @aaaaaaaa =  @schedule_event.keys
   @bbbbbbbb =  @schedule_event.values


  end

  # GET /presents/1
  # GET /presents/1.json
  def show
    @presents = Present.all
    @users = User.all
    @result = user_signed_in?
  end

  # GET /presents/new
  def new
    @present = Present.new
    @userid = current_user
    @result = user_signed_in? 
    @posts = Present.where(created_by: current_user)
  end

  # GET /presents/1/edit
  def edit
  end

  # POST /presents
  # POST /presents.json
  def create

    @present = Present.new(present_params)

    amazon_raw_url = amazon_params["amazon_url"]
    amazon_jp_domain = "amazon.co.jp"

    if amazon_raw_url.include?(amazon_jp_domain)

      puts amazon_raw_url
      agent = Mechanize::new
      agent.get(amazon_raw_url)
      print ("\ninsert url")
      @elements = agent.page.search('table')
    puts @elements

    elsif
    puts "error"
    end

    respond_to do |format|
      if @present.save
        format.html { redirect_to @present, notice: 'Present was successfully created.' }
        format.json { render :show, status: :created, location: @present }

      else
        format.html { render :new }
        format.json { render json: @present.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /presents/1
  # PATCH/PUT /presents/1.json
  def update
    respond_to do |format|
      if @present.update(present_params)
        format.html { redirect_to @present, notice: 'Present was successfully updated.' }
        format.json { render :show, status: :ok, location: @present }
      else
        format.html { render :edit }
        format.json { render json: @present.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presents/1
  # DELETE /presents/1.json
  def destroy
    @present.destroy
    respond_to do |format|
      format.html { redirect_to presents_url, notice: 'Present was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @present.liked_by current_user
    redirect_to action: 'index'
  end

  def dislike
    @present.disliked_by current_user
    redirect_to action: 'index'
  end

  def unvote
    @present.unvote_by current_user
    redirect_to action: 'index'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_present
      @present = Present.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def present_params
      params.require(:present).permit(:brand, :price, :image, :youage, :cat, :man, :enquete, :title)
    end
    
    def amazon_params
      params.require(:present).permit(:amazon_url)
    end
end
