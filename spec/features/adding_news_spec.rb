require 'spec_helper'

feature 'Adding news' do
  background do
    @user = create(:user)
    log_in @user
  end

  scenario 'Successful news adding' do
    click_link 'Add news'
    fill_in 'Title', with: 'Some news'
    fill_in 'Content', with: 'Some content'
    click_button 'Create'
    page.should have_content 'The news has been added'
  end

  scenario 'Unsuccessful news adding' do
    click_link 'Add news'
    click_button 'Create'
    page.should have_content "Title can't be blank"
    page.should have_content "Content can't be blank"
  end
end
