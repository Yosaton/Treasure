require 'rails_helper'
require 'spec_helper'

RSpec.describe Listing, type: :model do
    let(:title) { 'Socks'}
    let(:price) { 50 }
    let(:city) { 'Kuala Lumpur'}
    let(:place) { 'Uptown Damansara'}
    let(:latitude) { '51.501564'}
    let(:longitude) { '-0.141944'}
    let(:description) { 'sd'}


    
    context "associations" do
        it { should belong_to(:user)}
    end
    
    context "description" do
        
        it 'takes in description with less than 5 characters' do
            @user = User.create(first_name: "bob", last_name: "rice", email: "plays@e.com", password: "shithole")
            # @listing = Listing.create(title: "steak", price: 5, city:"nashville", description: "lossaop", place:"nippers corner", user_id:@user.id)
            # expect(@listing.save).to eq(false)
            @listing = Listing.create(title: title, price: price, city: city, description: description, place:place, user_id: @user.id)
            expect(Listing.find_by(description: description)).not_to be nil

        end 
    end
    
    # context "create method" do
    
    
    #     it "takes in a description that is too short" do
    #         expect(@listing.save).to eq(false)
    #     end
end

