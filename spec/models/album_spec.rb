require 'rails_helper'

RSpec.describe Album, :type => :model do
  let(:photo) { Photo.new }

  subject { described_class.new(name: 'London') }

  it "Is invalid without name" do
    subject.name = nil
    expect(subject).to be_invalid
  end

  it "Is valid with name" do
    expect(subject).to be_valid
  end

  describe "Associations" do
    it { should have_many(:photos) }
  end
end
