class RoomPricesController < ApplicationController
  before_action :set_room_price, only: [:show, :edit, :update, :destroy]

  # GET /room_prices
  # GET /room_prices.json
  def index
    @room_prices = RoomPrice.all
  end

  # GET /room_prices/1
  # GET /room_prices/1.json
  def show
  end

  # GET /room_prices/new
  def new
    @room_price = RoomPrice.new
  end

  # GET /room_prices/1/edit
  def edit
  end

  # POST /room_prices
  # POST /room_prices.json
  def create
    @room_price = RoomPrice.new(room_price_params)

    respond_to do |format|
      if @room_price.save
        format.html { redirect_to @room_price, notice: 'Room price was successfully created.' }
        format.json { render :show, status: :created, location: @room_price }
      else
        format.html { render :new }
        format.json { render json: @room_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_prices/1
  # PATCH/PUT /room_prices/1.json
  def update
    respond_to do |format|
      if @room_price.update(room_price_params)
        format.html { redirect_to @room_price, notice: 'Room price was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_price }
      else
        format.html { render :edit }
        format.json { render json: @room_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_prices/1
  # DELETE /room_prices/1.json
  def destroy
    @room_price.destroy
    respond_to do |format|
      format.html { redirect_to room_prices_url, notice: 'Room price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_price
      @room_price = RoomPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_price_params
      params.require(:room_price).permit(:category, :maxOccupancy, :price)
    end
end
