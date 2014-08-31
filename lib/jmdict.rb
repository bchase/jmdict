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

  def self.xml_entries
    xml.xpath('JMdict/entry')
  end

  def self.each_entry(&block)
    xml_entries.each do |xml_entry|
      entry = Entry.parse_from_nokogiri xml_entry
      yield entry
    end
  end
end
