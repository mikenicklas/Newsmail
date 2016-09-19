require 'spec_helper'

describe Newsmail::Article do
  
  subject { Newsmail::Article.new('source_name', {}) }
  
  it 'should assign a source' do
    expect(subject.source).to eql 'source_name'
  end
end