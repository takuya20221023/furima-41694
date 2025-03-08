require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # インスタンス変数を使う
  end

  # 正常系のテスト
  context '正常な属性が与えられた場合' do
    it '有効な属性を持つ場合はユーザーが有効であること' do
      expect(@user).to be_valid
    end
  end

  # 異常系のテスト
  context '無効な属性が与えられた場合' do
    ## 必須項目のテスト
    it 'メールアドレスがない場合は無効であること' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'パスワードがない場合は無効であること' do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it 'パスワードと確認用パスワードが一致しない場合は無効であること' do
      @user.password_confirmation = 'differentpassword'
      expect(@user).not_to be_valid
    end

    it 'ニックネームがない場合は無効であること' do
      @user.nickname = nil
      expect(@user).not_to be_valid
    end

    it '姓（last_name）がない場合は無効であること' do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it '名（first_name）がない場合は無効であること' do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it '姓（last_name_kana）がない場合は無効であること' do
      @user.last_name_kana = nil
      expect(@user).not_to be_valid
    end

    it '名（first_name_kana）がない場合は無効であること' do
      @user.first_name_kana = nil
      expect(@user).not_to be_valid
    end

    it '生年月日（birth_date）がない場合は無効であること' do
      @user.birth_date = nil
      expect(@user).not_to be_valid
    end

    ## メールアドレスのテスト
    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email) # 同じメールを使う
      expect(another_user).not_to be_valid
    end

    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'testexample.com'
      expect(@user).not_to be_valid
    end

    ## パスワードのテスト
    it 'パスワードが6文字未満では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      expect(@user).not_to be_valid
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      expect(@user).not_to be_valid
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).not_to be_valid
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ａｂｃ１２３'
      @user.password_confirmation = 'ａｂｃ１２３'
      expect(@user).not_to be_valid
    end

    ## 姓・名（全角）のテスト
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'Yamada'
      expect(@user).not_to be_valid
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro'
      expect(@user).not_to be_valid
    end

    ## 姓・名（カナ）のテスト
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'やまだ'
      expect(@user).not_to be_valid
    end

    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'たろう'
      expect(@user).not_to be_valid
    end
  end
end