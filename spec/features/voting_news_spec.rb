require 'spec_helper'

feature 'Voting news' do

  background do
    @article = create(:article, votes: 10)
  end

  scenario 'like news' do
    visit root_path
    within "#article_#{@article.id}" do
      click_link 'Like'
    end

    visit root_path
    page.should have_content 'Votes: 11'

  end
end
