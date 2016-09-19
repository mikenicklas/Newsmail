require 'spec_helper'

describe Newsmail::Source do
  
  subject{ Newsmail::Source }
  
  it 'should accept and assign initialization options' do
    opts = {title: 'XYZ Times', feed: 'http://asdf.com'}
    source = subject.new(opts)
    opts.each do |k,v|
      expect(source.send(k)).to eql v
    end
  end
  
  describe '#parse_and_create_article' do    
    let(:source) { subject.new }
    it 'should article and append to @articles' do
      allow(Newsmail::Parser).to receive(:parse_article).and_return({})
      source.parse_and_create_article('article')
      allow(source).to receive(:title).and_return 'Awesome Title'
      articles = source.instance_variable_get('@articles')
      expect(articles.size).to eql 1
    end
  end
  
  describe '#articles' do
    let(:source) { subject.new }
    
    it 'should fetch arcticles when nil' do
      source.instance_variable_set('@articles', [])
      expect(source).to receive(:get_articles)
      source.articles
    end
    
    it 'should return articles when they exist' do
      articles = ['article', 'article']
      source.instance_variable_set('@articles', articles)
      expect(source.articles).to eql articles
    end
  end

end