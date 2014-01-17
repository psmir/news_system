require 'spec_helper'

feature 'Deleting article' do
  background do
    @user = create(:user)
    @article = create(:article, user: @user)
    log_in @user
  end

  scenario 'Successful deleting' do
    visit root_path
    click_link @article.title
    click_link 'Delete'
    current_path.should eq user_articles_path(@user)
    page.should have_content 'The article has been deleted'
  end
end
