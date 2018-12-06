class ListingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @listing = Listing.find_by(city: params[:search])
        @listings = Listing.all
            if params[:search]
                @listings = Listing.omniscope(params[:search])
            end
                # @listings = @listings.page(params[:page])
                respond_to do |format|
                    # format.html {redirect_to listings_path(@listing.id)}
                    format.html
                    format.json{render json: @listings.map{|i| i.city}}
                end
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.user_id = current_user.id
        
            if @listing.save
                redirect_to edit_listing_path(@listing.id)
            else
                flash[:warning]=@listing.errors.full_messages
                render "new"
            end
            # redirect_to user_path(@listing.user.id)
    end

    def edit
        @listing = Listing.find(params[:id])
    end

    def show
        @listing = Listing.find(params[:id])
    end

    def update
        @listing = Listing.find(params[:id])
       
        if @listing.update(listing_params)
          redirect_to listings_path
        else
          render 'edit'
        end
    end

    def destroy
        @listing = Listing.find(params[:id])
        @listing.destroy
        redirect_to listings_path
    end

    private
    def listing_params
        params.require(:listing).permit(:title, :city, :price, :place, :latitude, :longitude, :description, {images:[]})
    end
end
