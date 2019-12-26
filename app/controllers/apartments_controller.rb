class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  # GET /apartments
  # GET /apartments.json
  def index
    # @apartments = Apartment.all
    @apartments = policy_scope(Apartment).order(created_at: :desc)
  end

  def index_district
    @district = params["district"]
    @apartments = policy_scope(Apartment).where(district: params[:district]).order(created_at: :desc)
    authorize @apartments
    render :index
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    authorize @apartment
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
    authorize @apartment
  end

  # GET /apartments/1/edit
  def edit
    authorize @apartment
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.status = 'Available'
    @apartment.user = current_user

    authorize @apartment

    respond_to do |format|
      if @apartment.save
        params[:photos][:img].each do |a|
          @photo = @apartment.photos.create!(:img => a)
        end
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    authorize @apartment
    respond_to do |format|
      if @apartment.update(apartment_params)
        unless params[:photos].nil?
          params[:photos][:img].each do |a|
            @photo = @apartment.photos.create!(:img => a)
          end
        end
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    authorize @apartment
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:address, :price, :latitude, :longtitude, :district, :description, :size, :year_built, :bedrooms, :elevator, :furnished, photos_attributes: [:img])
    end
end
