module TodoCreator
  def create_todo_named(name)
    fill_in :name, with: name
    click_button 'Add Task'
  end
end

World TodoCreator
