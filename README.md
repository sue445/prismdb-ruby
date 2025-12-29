# Prismdb
[PrismDB](https://prismdb.takanakahiko.me/) API client for ruby

[![Gem Version](https://badge.fury.io/rb/prismdb.svg)](https://badge.fury.io/rb/prismdb)
[![test](https://github.com/sue445/prismdb-ruby/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/prismdb-ruby/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/sue445/prismdb-ruby/badge.svg?branch=master)](https://coveralls.io/github/sue445/prismdb-ruby?branch=master)
[![Maintainability](https://qlty.sh/gh/sue445/projects/prismdb-ruby/maintainability.svg)](https://qlty.sh/gh/sue445/projects/prismdb-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prismdb'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install prismdb

## Usage

```ruby
require "prismdb"

client = Prismdb::Client.new

characters = client.get_characters

characters.map(&:name)
# => ["赤城 あんな", "赤井 めが姉ぇ", "青葉 りんか", "だいあ", "ドロシー・ウェスト", "ファルル", "ガァルル", "北条 コスモ", "北条 そふぃ", "ジャニス", "ジュリィ", "じゅのん", "金森 まりあ", "かのん", "黄木 あじみ", "黒川 すず", "黒須 あろま", "レオナ・ウェスト", "真中 らぁら", "真中 のん", "緑川 さら", "緑風 ふわり", "南 みれぃ", "萌黄 えも", "桃山 みらい", "鍋島 ちゃん子", "七星 あいら", "虹ノ咲 だいあ", "ぴのん", "紫藤 める", "紫京院 ひびき", "白玉 みかん", "白鳥 アンジュ", "太陽 ペッパー", "東堂 シオン", "月川 ちり"]

characters[0]
# => #<Prismdb::Response _key="akagi_anna" birthday="7月6日" blood_type="O型" cv="芹澤優" favorite_brand="dolly_waltz" favorite_food="紅茶" height=147 name="赤城 あんな" name_kana="あかぎ あんな" type="ラブリー">

manaka_laala = client.find_character("manaka_laala")
# => #<Prismdb::Response birthday="11月20日" blood_type="O型" charm="ラブリー" cv="茜屋日海夏" favorite_brand="twinkle_ribbon" favorite_food="駄菓子" memberOf="solami_smile" name="真中 らぁら" name_kana="まなか らぁら" performerIn="pripara_50_dream_parade">

episodes = client.get_episodes
episodes[0]
# => #<Prismdb::Response _key="ad_1" episodeOfSeries="ad" lives=#<Hashie::Array ["ad_1_you_may_dream"]> サブタイトル="スタア誕生！" 放送日(TXN)="11/4/9" 演出="京極尚彦" 絵コンテ="青葉譲" 脚本="赤尾でこ" 話数=1>

pripara_1 = client.find_episode("pripara_1")
# => #<Prismdb::Response episodeOfSeries="pripara" lives=#<Hashie::Array ["pripara_1_make_it"]> アニメーション演出="Na Ki Chual" サブタイトル="アイドル始めちゃいました！" ストーリーボード="Sung Won Yong" 作画監修="森友宏樹" 放送日(TXN)="2014/7/5" 演出="徳本善信" 絵コンテ="森脇真琴" 脚本="土屋理敬" 話数=1>

songs = client.get_songs
songs[0]
# => #<Prismdb::Response _key="accha_koccha_game" lives=#<Hashie::Array []> name="あっちゃこっちゃゲーム" name_kana="あっちゃこっちゃげーむ">

make_it = client.find_song("make_it")
# => #<Prismdb::Response lives=#<Hashie::Array ["pripara_135_make_it", "pripara_1_make_it", "pripara_2_make_it", "pripara_37_make_it", "pripara_3_make_it", "pripara_4_make_it", "pripara_5_make_it", "pripara_63_make_it", "pripara_9_make_it"]> name="Make it!" name_kana="めいくいっと">

lives = client.get_lives
lives[0]
# => #<Prismdb::Response _key="ad_1_you_may_dream" liveOfEpisode="ad_1" performer="aira_and_rizumu" songPerformed="you_may_dream">

pripara_1_make_it = client.find_live("pripara_1_make_it")
# => #<Prismdb::Response liveOfEpisode="pripara_1" performer="laala_and_mirei" songPerformed="make_it">

series = client.get_series
series[0]
# => #<Prismdb::Response _key="ad" episodes=#<Hashie::Array ["ad_1", "ad_10", "ad_11", "ad_12", "ad_13", "ad_14", "ad_15", "ad_16", "ad_17", "ad_18", "ad_19", "ad_2", "ad_20", "ad_21", "ad_22", "ad_23", "ad_24", "ad_25", "ad_26", "ad_27", "ad_28", "ad_29", "ad_3", "ad_30", "ad_31", "ad_32", "ad_33", "ad_34", "ad_35", "ad_36", "ad_37", "ad_38", "ad_39", "ad_4", "ad_40", "ad_41", "ad_42", "ad_43", "ad_44", "ad_45", "ad_46", "ad_47", "ad_48", "ad_49", "ad_5", "ad_50", "ad_51", "ad_6", "ad_7", "ad_8", "ad_9"]> タイトル="プリティーリズム・オーロラドリーム">

series.map{ |h| h["タイトル"] }
# => ["プリティーリズム・オーロラドリーム", "プリティーリズム・ディアマイフューチャー", "アイドルタイムプリパラ", "キラッとプリ☆チャン", "プリパラ", "プリティーリズム・レインボーライブ"]

pripara = client.find_series("pripara")
# => #<Prismdb::Response episodes=#<Hashie::Array ["pripara_1", "pripara_10", "pripara_100", "pripara_101", "pripara_102", "pripara_103", "pripara_104", "pripara_105", "pripara_106", "pripara_107", "pripara_108", "pripara_109", "pripara_11", "pripara_110", "pripara_111", "pripara_112", "pripara_113", "pripara_114", "pripara_115", "pripara_116", "pripara_117", "pripara_118", "pripara_119", "pripara_12", "pripara_120", "pripara_121", "pripara_122", "pripara_123", "pripara_124", "pripara_125", "pripara_126", "pripara_127", "pripara_128", "pripara_129", "pripara_13", "pripara_130", "pripara_131", "pripara_132", "pripara_133", "pripara_134", "pripara_135", "pripara_136", "pripara_137", "pripara_138", "pripara_139", "pripara_14", "pripara_140", "pripara_15", "pripara_16", "pripara_17", "pripara_18", "pripara_19", "pripara_2", "pripara_20", "pripara_21", "pripara_22", "pripara_23", "pripara_24", "pripara_25", "pripara_26", "pripara_27", "pripara_28", "pripara_29", "pripara_3", "pripara_30", "pripara_31", "pripara_32", "pripara_33", "pripara_34", "pripara_35", "pripara_36", "pripara_37", "pripara_38", "pripara_39", "pripara_4", "pripara_40", "pripara_41", "pripara_42", "pripara_43", "pripara_44", "pripara_45", "pripara_46", "pripara_47", "pripara_48", "pripara_49", "pripara_5", "pripara_50", "pripara_51", "pripara_52", "pripara_53", "pripara_54", "pripara_55", "pripara_56", "pripara_57", "pripara_58", "pripara_59", "pripara_6", "pripara_60", "pripara_61", "pripara_62", "pripara_63", "pripara_64", "pripara_65", "pripara_66", "pripara_67", "pripara_68", "pripara_69", "pripara_7", "pripara_70", "pripara_71", "pripara_72", "pripara_73", "pripara_74", "pripara_75", "pripara_76", "pripara_77", "pripara_78", "pripara_79", "pripara_8", "pripara_80", "pripara_81", "pripara_82", "pripara_83", "pripara_84", "pripara_85", "pripara_86", "pripara_87", "pripara_88", "pripara_89", "pripara_9", "pripara_90", "pripara_91", "pripara_92", "pripara_93", "pripara_94", "pripara_95", "pripara_96", "pripara_97", "pripara_98", "pripara_99"]> タイトル="プリパラ">
```

All methods are followings

https://sue445.github.io/prismdb-ruby/Prismdb/Client

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/prismdb-ruby.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
