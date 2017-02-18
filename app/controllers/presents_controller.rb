class PresentsController < ApplicationController
  before_action :set_present, only: [:show, :edit, :update, :destroy, :like, :dislike, :unvote]
  before_action do
    RecordWithOperator.operator = current_user
  end

  # GET /presents
  # GET /presents.json
  def index

    @presents = Present.all
    @present = Present.new

    @users = User.all
    @user = User.find_by(params[:id])

    @collectionrelation = Collectionrelation.new

    @usernew = User.new
    @gets = Get.all

    @get = Get.new

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


    @mycollection = Collection.where(:created_by => current_user.id)
    @mycollection_name = @mycollection.pluck(:collection_name)


    @following = current_user.followees(@users)
    @following_id = @following.map { |str| str.id }
    @following_id.push(@userid)
    @following_posts = Present.where(created_by: @following_id)
    @following_posts_get = Get.where(created_by: @following_id)

    @posts = Present.where(created_by: current_user)

    @timeline = []
    @timeline.push(@following_posts)
    @timeline.push(@following_posts_get)
    @eee = @timeline.flatten!.sort_by{|aaa|aaa.created_at.strftime('%Y%m%d%T')}
    @eee = Kaminari.paginate_array(@eee.reverse!).page(params[:page]).per(10)


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
    

    end


         if @result

        @places = Get.where(:get_cat => "shoping", :location_check => true ).within(3, origin: [current_user.latitude, current_user.longitude],:order=>'distance')

        @eat_places = Get.where(:get_cat => "eating", :location_check => true).within(3, origin: [current_user.latitude, current_user.longitude],:order=>'distance')
        @friends_places = User.within(3, origin: [current_user.latitude, current_user.longitude],:order=>'distance')


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
        @befriends_root = User.find(@myfollowing_user_following.uniq)


        @users_all_id = @users.pluck(:id)
        @users_all_id.delete(current_user.id)
        @mydelete_allusers = User.where(:id => @users_all_id)

             

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
      "1205" => "今日は何の日でもありません。",
      "0101" => "今日は何の日でもありません。",
      "0102" => "今日は何の日でもありません。",
      "0103" => "今日は何の日でもありません。",
      "0104" => "今日は何の日でもありません。",
      "0105" => "今日は何の日でもありません。",
      "0106" => "今日は何の日でもありません。",
      "0107" => "今日は何の日でもありません。"
    }

   @aaaaaaaa =  @schedule_event.keys
   @bbbbbbbb =  @schedule_event.values

   end


  # GET /presents/1
  # GET /presents/1.json
  def show

  

    @presents = Present.all
    @users = User.all
    @present_id = params[:id]
    @result = user_signed_in?

    @chart_data_10_1 = Poll.where(:poll_age => 10..19, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_10_2 = Poll.where(:poll_age => 10..19, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_10_3 = Poll.where(:poll_age => 10..19, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_10_4 = Poll.where(:poll_age => 10..19, :present_id => @present_id ,:poll_id => 4).count
    @poll_10_19_check = @chart_data_10_1 + @chart_data_10_2 + @chart_data_10_3 + @chart_data_10_4
    @chart_data_10 = [['最高', @chart_data_10_1], ['いいね', @chart_data_10_2], ['まぁまぁ', @chart_data_10_3], ['うーん', @chart_data_10_4]]
    
    @chart_data_20_1 = Poll.where(:poll_age => 20..29, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_20_2 = Poll.where(:poll_age => 20..29, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_20_3 = Poll.where(:poll_age => 20..29, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_20_4 = Poll.where(:poll_age => 20..29, :present_id => @present_id ,:poll_id => 4).count
    @poll_20_29_check = @chart_data_20_1 + @chart_data_20_2 + @chart_data_20_3 + @chart_data_20_4
    @chart_data_20 = [['最高', @chart_data_20_1], ['いいね', @chart_data_20_2], ['まぁまぁ', @chart_data_20_3], ['うーん', @chart_data_20_4]]
    
    @chart_data_30_1 = Poll.where(:poll_age => 30..39, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_30_2 = Poll.where(:poll_age => 30..39, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_30_3 = Poll.where(:poll_age => 30..39, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_30_4 = Poll.where(:poll_age => 30..39, :present_id => @present_id ,:poll_id => 4).count
    @poll_30_39_check = @chart_data_30_1 + @chart_data_30_2 + @chart_data_30_3 + @chart_data_30_4
    @chart_data_30 = [['最高', @chart_data_30_1], ['いいね', @chart_data_30_2], ['まぁまぁ', @chart_data_30_3], ['うーん', @chart_data_30_4]]
    
    @chart_data_40_1 = Poll.where(:poll_age => 40..49, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_40_2 = Poll.where(:poll_age => 40..49, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_40_3 = Poll.where(:poll_age => 40..49, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_40_4 = Poll.where(:poll_age => 40..49, :present_id => @present_id ,:poll_id => 4).count
    @poll_40_49_check = @chart_data_40_1 + @chart_data_40_2 + @chart_data_40_3 + @chart_data_40_4
    @chart_data_40 = [['最高', @chart_data_40_1], ['いいね', @chart_data_40_2], ['まぁまぁ', @chart_data_40_3], ['うーん', @chart_data_40_4]]

    @chart_data_50_1 = Poll.where(:poll_age => 50..59, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_50_2 = Poll.where(:poll_age => 50..59, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_50_3 = Poll.where(:poll_age => 50..59, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_50_4 = Poll.where(:poll_age => 50..59, :present_id => @present_id ,:poll_id => 4).count
    @poll_50_59_check = @chart_data_50_1 + @chart_data_50_2 + @chart_data_50_3 + @chart_data_50_4
    @chart_data_50 = [['最高', @chart_data_50_1], ['いいね', @chart_data_50_2], ['まぁまぁ', @chart_data_50_3], ['うーん', @chart_data_50_4]]

    @chart_data_60_1 = Poll.where(:poll_age => 60..69, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_60_2 = Poll.where(:poll_age => 60..69, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_60_3 = Poll.where(:poll_age => 60..69, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_60_4 = Poll.where(:poll_age => 60..69, :present_id => @present_id ,:poll_id => 4).count
    @poll_60_69_check = @chart_data_60_1 + @chart_data_60_2 + @chart_data_60_3 + @chart_data_60_4
    @chart_data_60 = [['最高', @chart_data_60_1], ['いいね', @chart_data_60_2], ['まぁまぁ', @chart_data_60_3], ['うーん', @chart_data_60_4]]

    @chart_data_70_1 = Poll.where(:poll_age => 70..79, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_70_2 = Poll.where(:poll_age => 70..79, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_70_3 = Poll.where(:poll_age => 70..79, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_70_4 = Poll.where(:poll_age => 70..79, :present_id => @present_id ,:poll_id => 4).count
    @poll_70_79_check = @chart_data_70_1 + @chart_data_70_2 + @chart_data_70_3 + @chart_data_70_4
    @chart_data_70 = [['最高', @chart_data_70_1], ['いいね', @chart_data_70_2], ['まぁまぁ', @chart_data_70_3], ['うーん', @chart_data_70_4]]

    @chart_data_80_1 = Poll.where(:poll_age => 80..89, :present_id => @present_id ,:poll_id => 1).count
    @chart_data_80_2 = Poll.where(:poll_age => 80..89, :present_id => @present_id ,:poll_id => 2).count
    @chart_data_80_3 = Poll.where(:poll_age => 80..89, :present_id => @present_id ,:poll_id => 3).count
    @chart_data_80_4 = Poll.where(:poll_age => 80..89, :present_id => @present_id ,:poll_id => 4).count
    @poll_80_89_check = @chart_data_80_1 + @chart_data_80_2 + @chart_data_80_3 + @chart_data_80_4
    @chart_data_80 = [['最高', @chart_data_80_1], ['いいね', @chart_data_80_2], ['まぁまぁ', @chart_data_80_3], ['うーん', @chart_data_80_4]]

    @chart_all_data_1 = @chart_data_10_1 + @chart_data_20_1 + @chart_data_30_1 + @chart_data_40_1 + @chart_data_50_1 + @chart_data_60_1 + @chart_data_70_1 + @chart_data_80_1
    @chart_all_data_2 = @chart_data_10_2 + @chart_data_20_2 + @chart_data_30_2 + @chart_data_40_2 + @chart_data_50_2 + @chart_data_60_2 + @chart_data_70_2 + @chart_data_80_2
    @chart_all_data_3 = @chart_data_10_3 + @chart_data_20_3 + @chart_data_30_3 + @chart_data_40_3 + @chart_data_50_3 + @chart_data_60_3 + @chart_data_70_3 + @chart_data_80_3
    @chart_all_data_4 = @chart_data_10_4 + @chart_data_20_4 + @chart_data_30_4 + @chart_data_40_4 + @chart_data_50_4 + @chart_data_60_4 + @chart_data_70_4 + @chart_data_80_4
    @chart_all_data = [{"name":"購入金額","data":{"最高":@chart_all_data_1,"いいね":@chart_all_data_2,"まぁまぁ":@chart_all_data_3,"うーん":@chart_all_data_4}}]
    @present_id_comment = Present.find(params[:id])
    @new_comment = Comment.build_from( @present_id_comment, current_user.id, "")

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

    respond_to do |format|
      if @present.save
        format.html { redirect_to root_path, notice: 'Present was successfully created.' }
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

  def scopeget

   @dqwdwq = Get.where(:created_by => current_user.id)
  latitude = 32
  longitude = 42


  end

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
      params.require(:present).permit(:brand, :price, :image, :youage, :cat, :man, :enquete, :title, :latitude, :longitude)
    end
    
end
