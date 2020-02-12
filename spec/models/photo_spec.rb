require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:album) { Album.new(name: 'London') }

  subject { described_class.new(album: album) }

  it "Is valid" do
    expect(subject).to be_valid
  end

  it "Is invalid" do
    subject.album = nil
    expect(subject).to be_invalid
  end

  describe "Associations" do
    it { should belong_to(:album) }
  end
end
