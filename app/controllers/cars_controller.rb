class CarsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  WHEEL_USAGE_WARNING_THRESHOLD = 0.8

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def full_model
    @car = Car.find(params[:id])
    render json: { full_model: @car.full_model }
  end
  def available_trunk_space
    @car = Car.find(params[:id])
    render json: { available_trunk_space: @car.available_trunk_space }
  end
  def kilometers_before_wheel_change
    @car = Car.find(params[:id])
    render json: { kilometers_before_wheel_change: @car.kilometers_before_wheel_change }
  end
  def store_in_trunk
    @car = Car.find(params[:id])
    render json: { car: @car.store_in_trunk(params[:amount_to_store]) }
  end
  def wheel_usage_status
    @car = Car.find(params[:id])
    render json: {message: @car.wheel_usage_status}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:make, :model, :year, :kilometers, :max_trunk_space, :current_trunk_usage, :wheel_usage, :max_wheel_usage_before_change)
    end
end
