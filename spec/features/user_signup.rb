require 'rails_helper'

feature "Signup" do
    scenario "When a user signs up" do
      visit "/"
      click_on "Sign up"
      expect(page).to have_text("Signup page")

      fill_in "First name", :with => "bob"
      fill_in "Last name", :with => "bob"
      fill_in "Email", :with => "bob@bob.com"
      fill_in "Password", :with => "bob"
      fill_in "Phone number", :with => "21092811"

      click_button "Save User"
      
      page.html

      expect(page).to have_text("Trezure")


    end
  end