When /^I sign out$/ do
  click_link 'Sign out'
end

Then /^I should see that I have signed out$/ do
  page.should have_css("form[action='#{sessions_path}']")
end
