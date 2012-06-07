Given /^I have the following todos:$/ do |table|
  table.hashes.each do |row|
    create_todo_named row[:name]
  end
end

Given /^I have the following complete todos:$/ do |table|
  table.hashes.each do |row|
    create_todo_named row[:name]
    step %{I mark the todo "#{row[:name]}" as complete}
  end
end

When /^create a todo$/ do
  create_todo_named 'Remember the milk'
end

When /^I create an invalid todo$/ do
  create_todo_named ''
end

When /^I view my todos$/ do
  visit todos_path
end

When /^I mark the todo "(.*?)" as complete$/ do |todo_name|
  todo = Todo.where(name: todo_name).first
  find("##{dom_id(todo)} a.complete").click
end

When /^I mark the todo "(.*?)" as incomplete$/ do |todo_name|
  todo = Todo.where(name: todo_name).first
  find("##{dom_id(todo)} a.incomplete").click
end

When /^I update the todo "(.*?)" to "(.*?)"$/ do |old_todo_name, new_todo_name|
  todo = Todo.where(name: old_todo_name).first
  bip_text todo, :name, new_todo_name
end

Then /^I should be able to view my todos$/ do
  step %{I should see that I have signed in as "steve@example.com"}
end

Then /^my list of incomplete todos should be:$/ do |table|
  ensure_incomplete_todos_named table
end

Then /^my list of complete todos should be:$/ do |table|
  ensure_complete_todos_named table
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

Then /^I should see a todo error$/ do
  page.should have_css('.flash-error', text: 'Name can\'t be blank')
end
