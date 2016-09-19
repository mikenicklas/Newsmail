require 'spec_helper'

describe Newsmail::Mailer::Builder do
  
  subject { Newsmail::Mailer::Builder }
  
  it 'should render slim template with content attrs' do
    pending 'Will add content information later'
    template = subject.render(articles: [], content: {title: 'Test'})
    expect(template.include?('Test')).to eql true
  end
  
  it 'should render template with articles' do
    articles, content = [], {title: 'Your Articles'}
    ['Article 1', 'Article 2'].each do |article|
      opts = {link: "http://#{article}", description: "#{article * 10}", title: article}
      articles << Newsmail::Article.new('The Times', opts)
    end
    template = subject.render(articles: articles, content: content)
    expect(template.split('Read More').size).to eql 3
  end
  
end