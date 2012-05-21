require 'spec_helper'

describe User do
  it 'has the email it was instantiated with' do
    user_with_email = User.new('dude@example.com')
    user_with_email.email.should == 'dude@example.com'
  end
end
