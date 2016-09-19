require 'spec_helper'
require 'json'

describe Newsmail::Social::Facebook do
  subject{ Newsmail::Social::Facebook }
  
  it 'should declare a BASE' do
    expect(subject::BASE).to be_truthy
  end
  
  it '.signal' do
    sample_res = {shares: 200}.to_json
    allow(subject).to receive(:fetch_data).and_return(sample_res)
    expect(subject.signal('example.com')).to eql 200
  end
  
end