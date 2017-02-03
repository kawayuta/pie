class GetsController < ApplicationController
  before_action :set_get, only: [:show, :edit, :update, :destroy, :like, :dislike, :unvote]

 before_action do
    RecordWithOperator.operator = current_user
  end

  # GET /gets
  # GET /gets.json
  def index
    @gets = Get.all
  end

  # GET /gets/1
  # GET /gets/1.json
  def show
  end

  # GET /gets/new
  def new
    @get = Get.new
  end

  # GET /gets/1/edit
  def edit
  end

  # POST /gets
  # POST /gets.json
  def create
    @get = Get.new(get_params)
 
  @get.body_height = current_user.body_height
  @get.body_width = current_user.body_width
  @get.body_bust = current_user.body_bust
  @get.body_west = current_user.body_west
  @get.body_hip = current_user.body_hip
  @get.shoulder_width = current_user.shoulder_width
  @get.leg_height = current_user.leg_height
  @get.leg_width = current_user.leg_width
  @get.foot_height = current_user.foot_height
  @get.arm_height = current_user.arm_height
  @get.arm_width = current_user.arm_width
  @get.ring_finger_width = current_user.ring_finger_width

  @get.save
    respond_to do |format|
      if @get.save
        format.html { redirect_to :root, notice: 'Get was successfully created.' }
        format.json { render :show, status: :created, location: @get }
      else
        format.html { redirect_to :root }
        format.json { render json: @get.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gets/1
  # PATCH/PUT /gets/1.json
  def update
    respond_to do |format|
      if @get.update(get_params)
        format.html { redirect_to @get, notice: 'Get was successfully updated.' }
        format.json { render :show, status: :ok, location: @get }
      else
        format.html { render :edit }
        format.json { render json: @get.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gets/1
  # DELETE /gets/1.json
  def destroy
    @get.delete
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Get was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @get.liked_by current_user
    redirect_to(:back)
  end

  def dislike
    @get.disliked_by current_user
    redirect_to(:back)
  end

  def unvote
    @get.unvote_by current_user
    redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_get
      @get = Get.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def get_params
      params.require(:get).permit(:title, :getimage, :body, :price, :shopcat, :brand, :body_height, :body_width, :body_bust, :body_west, :body_hip, :shoulder_width, :leg_height, :leg_width, :foot_height, :arm_height, :arm_width, :ring_finger_width, :latitude, :longitude, :get_cat, :location_check)
    end


end
