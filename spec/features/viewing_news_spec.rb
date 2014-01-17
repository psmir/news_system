require 'spec_helper'

feature 'Viewing news' do

  background do
    @article1 = create(:article, title: 'title1', votes: 5)
    @article2 = create(:article, title: 'title2', votes: 30)
  end

  scenario 'viewing news' do
    visit root_path
    within '#articles' do
      page.text.should match "title2.*title1"
    end
  end

end
