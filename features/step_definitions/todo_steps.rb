When /^create a todo$/ do
  create_todo_named 'Remember the milk'
end

When /^I create an invalid todo$/ do
  create_todo_named ''
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
