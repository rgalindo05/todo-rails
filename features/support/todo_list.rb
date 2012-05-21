module TodoList

  def ensure_complete_todos_named(todo_names)
    ensure_todos_named 'ul#complete-todos', todo_names
  end

  def ensure_incomplete_todos_named(todo_names)
    ensure_todos_named 'ul#incomplete-todos', todo_names
  end

  def ensure_todos_named(class_name, todo_names)
    within class_name do
      todo_names.hashes.each_with_index do |row, index|
        page.should have_css("li:nth-child(#{index + 1})", text: row[:name])
      end
      page.should have_css('li', count: todo_names.hashes.length)
    end
  end
end

World TodoList
