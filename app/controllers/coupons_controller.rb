class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  
  # GET /coupons
  # GET /coupons.json
  def index
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
    @coupons = @restaurant.coupons

    respond_to do |format|
      format.html
      format.xml {render :xml => @coupons}
      redirect_to restaurant_path(@restaurant)
    end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    respond_to do |format|
      format.html
      format.xml {render :xml => @coupon}
    end
  end

  # GET /coupons/new
  def new
    @restaurant=Restaurant.friendly.find(params[:restaurant_id])
    @coupon = @restaurant.coupons.build
    respond_to do |format|
      format.html
      format.xml {render :xml => @coupon}
    end
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
    @coupon = @restaurant.coupons.create(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Your discount schedule was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to [@restaurant, @coupon], notice: 'Discount was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_coupons_url, notice: 'Discount was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @restaurant = Restaurant.friendly.find(params[:restaurant_id])
      @coupon = @restaurant.coupons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:id, :restaurant_id, :start_date, :end_date,
                                                              :start_time, :end_time, :value, :coupon_detail,
                                                              :two_week_coupon, :month_coupon, :number, 
                                                              :monday, :tuesday, :wednesday, :thursday,
                                                              :friday, :saturday, :sunday)
    end
end
