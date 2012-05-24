Given /^I have signed in$/ do
  step %{I sign in as "steve@example.com"}
end

When /^I sign in as "(.*?)"$/ do |email_address|
  visit root_path
  fill_in 'session[email]', with: email_address
  click_button 'Sign in'
end

Then /^I should be prompted to sign in$/ do
  page.should have_css('.flash.notice', text: 'Please sign in')
  page.should have_css("form[action='#{sessions_path}']")
end

Then /^I should see that I have signed in as "(.*?)"$/ do |email_address|
  within '.navbar' do
    page.should have_css("[data-current-user='#{email_address}']")
  end

  page.should have_css('h1', text: /todo/i)
end
