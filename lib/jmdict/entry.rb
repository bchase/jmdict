module JMDict
  class Entry
    def initialize(eid=nil, kanji=[], kana=[], glosses=[], pos=[])
      @eid, @kanji, @kana, @glosses, @pos = eid, kanji, kana, glosses, pos
    end

    attr_accessor :eid, :kanji, :kana, :glosses, :pos

    def self.component_xpaths
      @@component_xpaths ||= {
        eid:     "ent_seq",
        kanji:   "k_ele/keb",
        kana:    "r_ele/reb",
        glosses: "sense/gloss",
        pos:     "sense/pos|misc|dial",
      }
    end

    def self.xpath_for(attribute)
      component_xpaths[attribute]
    end

    def self.parse_from_nokogiri(xml)
      new.tap do |entry|
        entry.eid = xml.xpath(xpath_for(:eid)).first.text

        %i[kanji kana glosses pos].each do |attribute|
          vals = xml.xpath(xpath_for(attribute)).map(&:text)
          entry.send :"#{attribute}=", vals unless vals.empty?
        end
      end
    end
  end
end
