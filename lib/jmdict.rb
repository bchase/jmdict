require 'nokogiri'

require 'jmdict/version'
require 'jmdict/entry'

module JMDict
  def self.file_path
    Pathname.new 'lib/dicts/jmdict.xml'
  end

  def self.file
    file_path.open
  end

  def self.xml
    Nokogiri::XML(file)
  end

  def self.each_entry(&block)
    xml.xpath('JMdict/entry').each do |entry_xml|
      entry = Entry.parse_from_nokogiri entry_xml
      yield entry
    end
  end
end
