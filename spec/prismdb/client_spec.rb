RSpec.describe Prismdb::Client do
  let(:client) { Prismdb::Client.new }

  describe "#characters" do
    subject(:characters) { client.characters }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/character").
        to_return(status: 200, body: fixture("character.json"))
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

  describe "#character" do
    subject(:character) { client.character(key) }

    before do
      stub_request(:get, "https://prismdb.takanakahiko.me/api/character/manaka_laala").
        to_return(status: 200, body: fixture("character-manaka_laala.json"))
    end

    let(:key) { "manaka_laala" }

    its(:name)      { should eq "真中 らぁら" }
    its(:name_kana) { should eq "まなか らぁら" }
    its(:birthday)  { should eq "11月20日" }
    its(:cv)        { should eq "茜屋日海夏" }
  end
end
