require 'labelr'
require 'ftools'

describe Labelr::Document do

  after do
    File.delete('document.pdf')
  end

  it 'should generate blank pdf with 2 pages' do
    labels = Array.new(28)
    document = Labelr::Document.new(:pimaco6082)
    document.labels = labels
    document.print
    File.exist?('document.pdf').should be_true
    File.size('document.pdf').should == File.size('spec/pdfs/doc-pimaco6082-2pg.pdf')
  end

  it 'should generate blank pdf without label' do
    document = Labelr::Document.new(:pimaco6082)
    document.print
    File.exist?('document.pdf').should be_true
    File.size('document.pdf').should == File.size('spec/pdfs/doc-pimaco6082.pdf')
  end

  it 'should generate pdf with 25 labels and 2 pages' do
    labels = Array.new(25){"name\naddress1\naddress2\nzipcode   city - state"}
    document = Labelr::Document.new(:pimaco6082)
    document.labels = labels
    document.print
    File.exist?('document.pdf').should be_true
    File.size('document.pdf').should == File.size('spec/pdfs/doc-pimaco6082-25l-2pg.pdf')
  end

end

describe Labelr::Page do

  after do
    File.delete('page.pdf')
  end

  it 'should generate pdf with one label positioned at 3' do
    label = "name\naddress1\naddress2\nzipcode   city - state"
    page = Labelr::Page.new(:pimaco6082)
    page.add_label_at_position(3, label)
    page.print
    File.exist?('page.pdf').should be_true
    File.size('page.pdf').should == File.size('spec/pdfs/page-pimaco6082-lp3.pdf')
  end

  it 'should generate pdf with one label positioned at 3 and other positioned at 13' do
    label = "name\naddress1\naddress2\nzipcode   city - state"
    page = Labelr::Page.new(:pimaco6082)
    page.add_label_at_position(3, label)
    page.add_label_at_position(13, label)
    page.print
    File.exist?('page.pdf').should be_true
    File.size('page.pdf').should == File.size('spec/pdfs/page-pimaco6082-lp3-lp13.pdf')
  end

end
