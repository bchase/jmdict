module Dict
  # 1 generators -> models / migrations (indexes for searching speed)
  # 2 seeding -> file / nokogiri / parsing
  # 3 lookup -> search by hanzi / pinyin / kanji / kana / gloss(?)

  # 1 steal migrations / models from Zhdict 
  #   generators
  #     [ ] easy way of making migrations
  #     [ ] easy way of making models
  #   models
  #     [ ] dict name
  #     [ ] attribute path
  #     [ ] file path
  #     [ ] uniform access for varying attributes e.g. pronunciation -> kana / pinyin
  
  # 2 seeding
  #   [X] parsing convention -> GEM::XML::Entry
  #   [X] means of looping entries -> GEM::each_entry
  #   [ ] means of picking out e.g. POS abbrv meanings

  # 3 lookup
  #   [ ] search by full
  #   [ ] search by pronunciation
  #   [ ] search by gloss
  #   [ ] search by unknown e.g. for JA, test for kanji else search pron
end

module JMDict
end

module CEDict
end

# Japanese
kanji   = "今日は"
kana    = "こんにちは"

# Chinese
hanzi   = "你好"
pinyin1 = "ni3 hao3"
pinyin1 = "ni3hao3"
# pinyin3 = "nǐ hǎo"
# pinyin4 = "nǐhǎo"
