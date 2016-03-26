require 'spec_helper'

describe Finmail::Mailer::Builder do
  
  subject { Finmail::Mailer::Builder }
  
  it 'should render slim template' do
    template = subject.render(articles: [], content: {title: 'Test'})
    expect(template.include?('Test')).to eql true
  end
  
end