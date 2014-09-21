require 'nokogiri'

require 'jmdict/version'
require 'jmdict/entry'

module JMDict
  def self.root
    spec = Gem::Specification.find_by_name 'jmdict'
    Pathname.new spec.gem_dir
  end

  def self.file_path
    root.join 'lib', 'dicts', 'jmdict.xml'
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
