require 'spec_helper'

describe Finmail::Application do
  subject { Finmail::Application.new }
  
  it 'should #send_mail' do
    expect_any_instance_of(Finmail::Mail).to receive(:send)
    subject.send_mail
  end
  
end