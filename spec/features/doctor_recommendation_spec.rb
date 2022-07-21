require 'rails_helper'

RSpec.feature 'DoctorRecommendations', type: :feature do
  context 'leaves recommendation', js: true do
    it do
      visit new_user_session_path
      fill_in 'Phone', with: '0987654321'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      visit appointments_path
      fill_in 'Enter Recommendations', with: 'Test recommendation'
      click_button 'Send'
      expect(page).to have_content 'Recommendation was added'
      expect(page).to have_content 'Test recommendation'
    end
  end
end
