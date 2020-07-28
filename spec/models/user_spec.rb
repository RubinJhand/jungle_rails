require 'rails_helper'

RSpec.describe User, type: :model do
  category = Category.new(name: "Apparel")
  subject { described_class.new(name: "Jasper's Peppermint Candy", price: 199, quantity: 5, category: category)}

  describe 'Validations' do

    it "is valid when all four fields save" do
      subject.valid?
      expect(subject.errors.full_messages).to be_empty
    end

    it "is not valid when name is blank" do
      subject.name = nil
      subject.valid?
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid when price is blank" do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid when quantity is blank" do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors.full_messages).to include("Quantity can't be blank")

    end

    it "is not valid when category is blank" do
      subject.category = nil
      subject.valid?
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end

  end
end
