Then /^I should see an error message$/ do
  page.should have_css('.alert-error')
end
