require 'spec_helper'

feature 'Viewing an article' do
  background do
    @user = create(:user)
    log_in @user
    @article = create(:article)
  end

  scenario 'Viewing an article' do
    visit root_path
    click_link @article.title
    page.should have_content @article.title
    page.should have_content @article.content
    page.should have_content @article.user.email
    page.should have_content "less than a minute ago"
  end
end
