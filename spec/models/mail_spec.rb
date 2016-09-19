require 'spec_helper'

describe Newsmail::Mail do
  let(:content) { [{title: 'Title', 
    description: 'The description', link: 'http://asdf.com'}] }
  
  it 'should render mail' do
    expect(Newsmail::Mailer::Builder).to receive(:render)
    mailer = Newsmail::Mail.new
  end
  
end