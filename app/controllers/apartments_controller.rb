class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :index_district]

  def index
    @apartments = policy_scope(Apartment).order(created_at: :desc)
    authorize :apartment, :index?
  end

  def index_district
    @district = params["district"]
    @apartments = policy_scope(Apartment).where(district: params[:district]).order(created_at: :desc)
    
    if @apartments.count == 0
      @apartments = policy_scope(Apartment).order(created_at: :desc)
    end
    
    authorize :apartment, :index_district?
    render :index
  end

  def show
    authorize @apartment
  end

  def new
    @apartment = Apartment.new
    authorize @apartment
  end

  def edit
    authorize @apartment
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.status = 'Available'
    @apartment.user = current_user

    authorize @apartment

    if @apartment.save
      unless params[:photos].nil?
        params[:photos][:img].each do |a|
          @photo = @apartment.photos.create!(:img => a)
        end
      end
      redirect_to @apartment, notice: 'Apartment was successfully created.'
    else
      render :new, alert: 'Error on creating apartment.'
    end
  end

  def update
    authorize @apartment

    if @apartment.update(apartment_params)
      unless params[:photos].nil?
        params[:photos][:img].each do |a|
          @photo = @apartment.photos.create!(:img => a)
        end
      end
      redirect_to @apartment, notice: 'Apartment was successfully updated.'
    else
      render :edit, alert: 'Error on updating apartment.'
    end
  end

  def destroy
    authorize @apartment
    @apartment.destroy
    
    redirect_to apartments_url, notice: 'Apartment was successfully destroyed.'
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
