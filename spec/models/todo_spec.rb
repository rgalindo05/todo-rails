require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:name) }

  context '.complete' do
    it 'returns only todos where completed_at is set' do
      complete_todo = create(:todo, :complete)
      incomplete_todo = create(:todo, :incomplete)

      Todo.complete.should == [complete_todo]
    end
  end

  context '.incomplete' do
    it 'returns only todos where completed_at is set' do
      complete_todo = create(:todo, :complete)
      incomplete_todo = create(:todo, :incomplete)

      Todo.incomplete.should == [incomplete_todo]
    end
  end
end
