require 'spec_helper'

feature 'Viewing news' do
  scenario 'viewing news' do
    visit root_path
    page.should have_content 'News System'
  end

end
