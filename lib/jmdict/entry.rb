module JMDict
  class Entry
    def initialize(eid=nil, kanji=[], kana=[], glosses=[], pos=[])
      @eid, @kanji, @kana, @glosses, @pos = eid, kanji, kana, glosses, pos
    end

    attr_accessor :eid, :kanji, :kana, :glosses, :pos

    def self.component_xpaths
      @@component_xpaths ||= {
        eid:     "entry/ent_seq",
        kanji:   "entry/k_ele/keb",
        kana:    "entry/r_ele/reb",
        glosses: "entry/sense/gloss",
        pos:     "entry/sense/pos|misc|dial",
      }
    end

    def self.xpath_for(attribute)
      component_xpaths[attribute]
    end

    def self.parse_from_xml_element_str(str)
      xml, entry = Nokogiri::XML(str), new

      entry.eid = xml.xpath(xpath_for(:eid)).first.text

      %i[kanji kana glosses pos].each do |attribute|
        vals = xml.xpath(xpath_for(attribute)).map(&:text)
        entry.send :"#{attribute}=", vals unless vals.empty?
      end

      entry
    end
  end
end
