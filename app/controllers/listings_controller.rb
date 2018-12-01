class ListingsController < ApplicationController
    def index
        @listings = Listing.all
    end

    def create
        @listing = Listing.new(article_params)
        @listing.user_id = current_user.id
        @listing.save!
        redirect_to users_path
    end
    
end
