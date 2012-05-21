Given /^I have signed in$/ do
  step %{I sign in as "steve@example.com"}
end

When /^create a todo$/ do
  click_link 'Create a new todo'
  fill_in 'Name', with: 'Remember the milk'
  click_button 'Create todo'
end

Then /^I should have (\d+) todos?$/ do |todo_count|
  within 'ul#todos' do
    page.should have_css('li', count: todo_count.to_i)
    page.should have_content('Remember the milk')
  end
end

Then /^I should have no todos?$/ do
  within 'ul#todos' do
    page.should have_no_css('li')
  end
end

When /^I create an invalid todo$/ do
  click_link 'Create a new todo'
  fill_in 'Name', with: ''
  click_button 'Create todo'
end

Then /^I should see an error message$/ do
  page.should have_css('.errorExplanation')
end
