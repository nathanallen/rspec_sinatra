require 'spec_helper'

describe MenuItem do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :menu }
  end

  context "associations" do
    it { should belong_to :menu }
  end

  context "#name" do 
    let(:name) {"fish"}
    let(:item) {MenuItem.new(name: name)}
    it "returns the name" do
      expect(item.name).to eq "fish"
    end
  end
end
