require 'spec_helper'
describe Menu do
  let(:menu) { FactoryGirl.build :menu }
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_at }
    it "#end date must be after start date" do
      menu.end_at = Time.now - 1.day
      menu.save
      expect(menu.errors.messages[:end_at]).to include("end date must be after start date")
      p menu
    end
  end

  context "associations" do
    it { should have_many :menu_items }
  end

  context "#name" do
    it "removes special characters" do
      menu.name = "lunch-menu"
      menu.end_at = Time.now #hackish
      expect {
        menu.save
      }.to change { menu.name }.from("lunch-menu").to("lunch menu")
    end
  end
end


 # it "requires a name" do
 #      menu.name = nil
 #      menu.save
 #      expect(menu.errors.full_messages).to include("Name can't be blank")
 #    end
