require 'spec_helper'

describe Newsmail::Application do
  subject { Newsmail::Application.new }
  
  it 'should #send_mail' do
    expect_any_instance_of(Newsmail::Mail).to receive(:send)
    subject.send_mail
  end
  
end