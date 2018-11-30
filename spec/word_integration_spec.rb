require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Adding a new word', {:type => :feature}) do
  it('takes user input and adds a word to the dictionary') do
    visit('/')
    fill_in('word', with: 'magic')
    fill_in('definition', with: 'look ma, no hands')
    click_button('Submit')
    expect(page).to have_content('Magic')
  end
end

# describe('viewing a word definition', {:type => :feature}) do
#   it('navigates user to word page to view definition') do
#     visit('/')
#     fill_in('word', with: 'magic')
#     fill_in('definition', with: 'look ma, no hands')
#     click_button('Submit')
#     save_and_open_page
#     click_link('/definition/0')
#     expect(page).to have_content('look ma, no hands')
#   end
# end
