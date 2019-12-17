class PhotosController < ApplicationController
	def destroy

		@apartment = Apartment.find(params[:apartment_id])
		@photo = @apartment.photos.find(params[:id])
		authorize @photo

		@photo.destroy
		redirect_to edit_apartment_path(@apartment), notice: 'Photo was successfully destroyed.'

	end
end
