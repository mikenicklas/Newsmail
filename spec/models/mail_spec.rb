require 'spec_helper'

describe Finmail::Mail do
  let(:content) { [{title: 'Title', 
    description: 'The description', link: 'http://asdf.com'}] }
  
  it 'should render mail' do
    expect(Finmail::Mailer::Builder).to receive(:render)
    mailer = Finmail::Mail.new(content)
  end
  
end