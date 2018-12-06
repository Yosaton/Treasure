require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
    let(:name) {User.new(first_name: "bob", email: "a@a.com", password:"shit")}
    let(:correct_email) { "bob@bob.com"}

        context "validations" do
            it { should validate_presence_of(:email) }
            it { should validate_uniqueness_of(:email) }
        end

        context "associations" do
            # it { should have_many(:listings) }
            it { should have_many(:authentications) }
        end


    it "oauth requires 2 arguments" do
        expect { User.create_with_auth_and_hash}.to raise_error(ArgumentError)
    end

    it "takes in a correct email" do
        expect{User.create(email: correct_email)}.not_to raise_error
    end

end