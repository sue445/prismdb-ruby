RSpec.describe Prismdb::Client do
  let(:client) { Prismdb::Client.new }
  let(:response_headers) { { "Content-Type" =>  "application/json" } }

  describe "#get_characters" do
    subject(:characters) { client.get_characters }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/character").
        to_return(status: 200, headers: response_headers, body: fixture("character.json"))
    end

    its(:count) { should be > 0 }

    describe "characters[0]" do
      subject { characters[0] }

      its(:name)      { should eq "赤城 あんな" }
      its(:name_kana) { should eq "あかぎ あんな" }
      its(:birthday)  { should eq "7月6日" }
      its(:cv)        { should eq "芹澤優" }
    end
  end

  describe "#find_character" do
    subject { client.find_character(key) }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/character/manaka_laala").
        to_return(status: 200, headers: response_headers, body: fixture("character-manaka_laala.json"))
    end

    let(:key) { "manaka_laala" }

    its(:name)      { should eq "真中 らぁら" }
    its(:name_kana) { should eq "まなか らぁら" }
    its(:birthday)  { should eq "11月20日" }
    its(:cv)        { should eq "茜屋日海夏" }
  end

  describe "#get_episodes" do
    subject(:episodes) { client.get_episodes }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/episode").
        to_return(status: 200, headers: response_headers, body: fixture("episode.json"))
    end

    its(:count) { should be > 0 }

    describe "episodes[0]" do
      subject { episodes[0] }

      its("_key")       { should eq "ad_1" }
      its("サブタイトル") { should eq "スタア誕生！" }
      its("放送日(TXN)") { should eq "11/4/9" }
    end
  end

  describe "#find_episode" do
    subject { client.find_episode(key) }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/episode/pripara_1").
        to_return(status: 200, headers: response_headers, body: fixture("episode-pripara_1.json"))
    end

    let(:key) { "pripara_1" }

    its("サブタイトル") { should eq "アイドル始めちゃいました！" }
    its("放送日(TXN)") { should eq "2014/7/5" }
  end

  describe "#get_songs" do
    subject(:songs) { client.get_songs }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/song").
        to_return(status: 200, headers: response_headers, body: fixture("song.json"))
    end

    its(:count) { should be > 0 }

    describe "songs[0]" do
      subject { songs[0] }

      its(:_key) { should eq "accha_koccha_game" }
      its(:name) { should eq "あっちゃこっちゃゲーム" }
    end
  end

  describe "#find_song" do
    subject { client.find_song(key) }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/song/make_it").
        to_return(status: 200, headers: response_headers, body: fixture("song-make_it.json"))
    end

    let(:key) { "make_it" }

    its(:name)      { should eq "Make it!" }
    its(:name_kana) { should eq "めいくいっと" }
  end

  describe "#get_lives" do
    subject(:lives) { client.get_lives }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/live").
        to_return(status: 200, headers: response_headers, body: fixture("live.json"))
    end

    its(:count) { should be > 0 }

    describe "lives[0]" do
      subject { lives[0] }

      its(:_key)      { should eq "ad_1_you_may_dream" }
      its(:performer) { should eq "aira_and_rizumu" }
    end
  end

  describe "#find_live" do
    subject { client.find_live(key) }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/live/pripara_1_make_it").
        to_return(status: 200, headers: response_headers, body: fixture("live-pripara_1_make_it.json"))
    end

    let(:key) { "pripara_1_make_it" }

    its(:performer)     { should eq "laala_and_mirei" }
    its(:songPerformed) { should eq "make_it" }
  end

  describe "#get_series" do
    subject(:series) { client.get_series }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/series").
        to_return(status: 200, headers: response_headers, body: fixture("series.json"))
    end

    its(:count) { should be > 0 }

    describe "series[0]" do
      subject { series[0] }

      its(:_key)     { should eq "ad" }
      its("タイトル") { should eq "プリティーリズム・オーロラドリーム" }
    end
  end

  describe "#find_series" do
    subject { client.find_series(key) }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/series/pripara").
        to_return(status: 200, headers: response_headers, body: fixture("series-pripara.json"))
    end

    let(:key) { "pripara" }

    its("タイトル") { should eq "プリパラ" }
  end
end
