require 'rails_helper'

RSpec.describe User, type: :model do
  # 正常系のテスト
  context '正常な属性が与えられた場合' do
    it '有効な属性を持つ場合はユーザーが有効であること' do
      user = FactoryBot.build(:user) # FactoryBotを使用してユーザーを生成
      expect(user).to be_valid
    end
  end

  # 異常系のテスト
  context '無効な属性が与えられた場合' do
    it 'メールアドレスがない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'パスワードがない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it 'パスワードとパスワード確認が一致しない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, password: 'password', password_confirmation: 'differentpassword')
      expect(user).not_to be_valid
    end

    it 'ニックネームがない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, nickname: nil)
      expect(user).not_to be_valid
    end

    it '苗字がない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it '名前がない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it '苗字カナがない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, last_name_kana: nil)
      expect(user).not_to be_valid
    end

    it '名前カナがない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, first_name_kana: nil)
      expect(user).not_to be_valid
    end

    it '生年月日がない場合はユーザーが無効であること' do
      user = FactoryBot.build(:user, birth_date: nil)
      expect(user).not_to be_valid
    end
  end
end
