require 'spec_helper'

feature 'Viewing news' do

  background do
    @user = create(:user)
    @article1 = create(:article, title: 'title1', votes: 5, user: @user)
    @article2 = create(:article, title: 'title2', votes: 30)
  end

  scenario 'viewing news' do
    visit root_path
    within '#articles' do
      page.text.should match "title2.*title1"
    end
  end

  scenario 'viewing own news' do
    log_in @user
    click_link 'My news'
    page.should have_content @article1.title
    page.should_not have_content @article2.title
  end

end
