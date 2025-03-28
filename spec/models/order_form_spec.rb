require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  it "すべての情報が正しく入力されていれば保存できる" do
    expect(@order_form).to be_valid
  end

  it "tokenが空では保存できない" do
    @order_form.token = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Token can't be blank")
  end

  it "郵便番号が空では保存できない" do
    @order_form.postal_code = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
  end
end
