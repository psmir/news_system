require 'spec_helper'

feature 'Editing articles' do
  background do
    @user = create(:user)
    @article = create(:article, user: @user)

    log_in @user
    visit article_path @article
    click_link 'Edit'
  end

  scenario 'Successful editing' do
    fill_in 'Title', with: 'New title'
    fill_in 'Content', with: 'New content'
    click_button 'Update'
    current_path.should eq article_path(@article)
    page.should have_content 'The article has been updated'
    page.should have_content 'New title'
    page.should have_content 'New content'
  end

  scenario 'Unsuccessful editing' do
    fill_in 'Title', with: ''
    fill_in 'Content', with: ''
    click_button 'Update'
    page.should have_content "Title can't be blank"
    page.should have_content "Content can't be blank"
  end
end
