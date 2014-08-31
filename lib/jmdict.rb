require 'nokogiri'

require "jmdict/version"
require "jmdict/entry"

module JMDict
  def self.file_path
    Pathname.new 'lib/dicts/jmdict.xml'
  end

  def self.file
    file_path.open
  end

  ENTRY_OPEN_TAG  = %r{<entry}
  ENTRY_CLOSE_TAG = %r{</entry}

  def self.each_entry(&block)
    str = ''
    file.each do |line|
      if str.empty?
        str << line if line.match ENTRY_OPEN_TAG
      else
        str << line 

        if line.match ENTRY_CLOSE_TAG
          yield Entry.parse_from_xml_element_str(str)
          str = ''
        end
      end
    end
  end
end
