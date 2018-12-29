class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :admin_owner_only, except: [:show, :index]
  before_action :restaurant_owner, except: [:show, :index, :new, :create]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @attachments = @restaurant.attachments.all
    @coupons = @restaurant.coupons.all
    @cuisines = @restaurant.cuisines.all
  end

  # GET /restaurants/new
  def new
    @restaurant = current_user.restaurants.build
    @attachment = @restaurant.attachments.build
    @coupon = @restaurant.coupons.build
    @cuisine = @restaurant.cuisines.build
    
  end

  # GET /restaurants/1/edit
  def edit
    @attachment = @restaurant.attachments.build
    @coupon = @restaurant.coupons.build
    @cuisine = @restaurant.cuisines.build
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    # @restaurant = Restaurant.new(restaurant_params)
    @restaurant = current_user.restaurants.create!(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        if(!params[:attachments].nil?)
          params[:attachments]['image'].each do |a|
            @attachment = @restaurant.attachments.create!(:image => a)
          end
        end
        flash[:success] = "Restaurant was successfully created."
        format.html { redirect_to @restaurant, notice: 'Your restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
        format.js   { render text: "window.location.href = '#{ restaurant_path @restaurant }';" }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        if(!params[:attachments].nil?)
          params[:attachments]['image'].each do |a|
            @attachment = @restaurant.attachments.create!(:image => a)
          end
        end
        flash[:success] = "Restaurant was successfully updated."
        format.html { redirect_to @restaurant, notice: 'Your restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
        format.js   { render text: "window.location.href = '#{ restaurant_path @restaurant }';" }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Your restaurant was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def restaurant_owner
      unless @restaurant.user_id == current_user.id or current_user.admin?
        flash[:notice] = 'Access denied, as you are not owner of this restaurant.'
        redirect_to restaurant_path
      end
  end  
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      #params.fetch(:restaurant, {})
      params.require(:restaurant).permit(:name, :address, :city, :state, :description, :zipcode, 
                                         :latitude, :longitude, :max_people, :open_time, :close_time, 
                                         :phone_number, :website_link, :max_table, :cost_range_min, 
                                         :breakfast_start, :breakfast_end, :lunch_start, :lunch_end, 
                                         :dinner_start, :dinner_end,
                                         :parking_valet, :outdoor_seating, :pet_friendly, :handicap_accessible,
                                         :smoking_allowed, :cocktails, :private_parties, :big_groups, 
                                         :cost_range_max, :location, :blurb, {images: []}, :cuisine_ids,
                                         attachments_attributes: [:id, :restaurant_id, :image],
                                         coupons_attributes: [:id, :restaurant_id, :start_date, :end_date,
                                                              :start_time, :end_time, :value, :coupon_detail,
                                                              :two_week_coupon, :month_coupon, :number, 
                                                              :monday, :tuesday, :wednesday, :thursday,
                                                              :friday, :saturday, :sunday])
    end
end
