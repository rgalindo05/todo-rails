When /^I sign in as "(.*?)"$/ do |email_address|
  visit root_path
  fill_in 'session[email]', with: email_address
  click_button 'Sign in'
end

Then /^I should see that I have signed in as "(.*?)"$/ do |email_address|
  within 'header' do
    page.should have_css("[data-current-user='#{email_address}']")
  end

  page.should have_css('h1', text: /todo/i)
end
