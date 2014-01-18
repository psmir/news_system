require 'spec_helper'

feature 'Voting news' do

  background do
    @article = create(:article, votes: 10)
  end

  scenario 'like news', js: true do
    visit root_path
    within "#article_#{@article.id}" do
      click_link 'Like'
      page.should have_content 'Votes: 11'
      page.should_not have_selector '.voting'
    end


  end
end
