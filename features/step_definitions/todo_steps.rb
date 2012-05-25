When /^create a todo$/ do
  create_todo_named 'Remember the milk'
end

When /^I create an invalid todo$/ do
  create_todo_named ''
end

When /^I view my todos$/ do
  visit todos_path
end

Then /^I should have (\d+) todos?$/ do |todo_count|
  within 'ul#incomplete-todos' do
    page.should have_css('li', count: todo_count.to_i)
    page.should have_content('Remember the milk')
  end
end

Then /^I should have no todos?$/ do
  visit todos_path
  within 'ul#incomplete-todos' do
    page.should have_no_css('li')
  end
end

Given /^I have the following todos:$/ do |table|
  table.hashes.each do |row|
    create_todo_named row[:name]
  end
end

When /^I mark the todo "(.*?)" as completed$/ do |todo_name|
  todo = Todo.where(name: todo_name).first
  find("##{dom_id(todo)} a.complete").click
end

Then /^my list of incomplete todos should be:$/ do |table|
  ensure_incomplete_todos_named table
end

Then /^my list of complete todos should be:$/ do |table|
  ensure_complete_todos_named table
end

Then /^I should be able to view my todos$/ do
  step %{I should see that I have signed in as "steve@example.com"}
end
