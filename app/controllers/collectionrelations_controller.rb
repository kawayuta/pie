class CollectionrelationsController < ApplicationController
  before_action :set_collectionrelation, only: [:show, :edit, :update, :destroy]

  # GET /collectionrelations
  # GET /collectionrelations.json
  def index
    @collectionrelations = Collectionrelation.all
  end

  # GET /collectionrelations/1
  # GET /collectionrelations/1.json
  def show
  end

  # GET /collectionrelations/new
  def new
    @collectionrelation = Collectionrelation.new
  end

  # GET /collectionrelations/1/edit
  def edit
  end

  # POST /collectionrelations
  # POST /collectionrelations.json
  def create
    @collectionrelation = Collectionrelation.new(collectionrelation_params)

    respond_to do |format|
      if @collectionrelation.save
        format.html { redirect_to root_path, notice: 'Collectionrelation was successfully created.' }
        format.json { render :show, status: :created, location: @collectionrelation }
      else
        format.html { render  root_path }
        format.json { render json: @collectionrelation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectionrelations/1
  # PATCH/PUT /collectionrelations/1.json
  def update
    respond_to do |format|
      if @collectionrelation.update(collectionrelation_params)
        format.html { redirect_to  root_path, notice: 'Collectionrelation was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectionrelation }
      else
        format.html { render  root_path }
        format.json { render json: @collectionrelation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectionrelations/1
  # DELETE /collectionrelations/1.json
  def destroy
    @collectionrelation.destroy
    respond_to do |format|
      format.html { redirect_to collectionrelations_url, notice: 'Collectionrelation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectionrelation
      @collectionrelation = Collectionrelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collectionrelation_params
      params.require(:collectionrelation).permit(:relay_get_post_id, :relay_user_id, :relay_collection_title)
    end
end
