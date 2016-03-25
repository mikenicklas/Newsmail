require 'spec_helper'

describe Finmail::Article do
  
  subject { Finmail::Article.new('source_name', {}) }
  
  it 'should assign a source' do
    expect(subject.source).to eql 'source_name'
  end
end