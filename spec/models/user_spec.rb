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
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'パスワードがない場合は無効であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'パスワードと確認用パスワードが一致しない場合は無効であること' do
      @user.password_confirmation = 'differentpassword'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'ニックネームがない場合は無効であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it '姓（last_name）がない場合は無効であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it '名（first_name）がない場合は無効であること' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it '姓（last_name_kana）がない場合は無効であること' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("can't be blank")
    end

    it '名（first_name_kana）がない場合は無効であること' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
    end

    it '生年月日（birth_date）がない場合は無効であること' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors[:birth_date]).to include("can't be blank")
    end

    ## メールアドレスのテスト
    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email) # 同じメールを使う
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors[:email]).to include('is invalid')
    end

    ## パスワードのテスト
    it 'パスワードが6文字未満では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors[:password]).to include('は半角英数字を含めてください（記号・全角文字は使用不可）')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors[:password]).to include('は半角英数字を含めてください（記号・全角文字は使用不可）')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ａｂｃ１２３'
      @user.password_confirmation = 'ａｂｃ１２３'
      @user.valid?
      expect(@user.errors[:password]).to include('は半角英数字を含めてください（記号・全角文字は使用不可）')
    end

    ## 姓・名（全角）のテスト
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'Yamada'
      @user.valid?
      expect(@user.errors[:last_name]).to include('は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors[:first_name]).to include('は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    ## 姓・名（カナ）のテスト
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include('は全角カタカナで入力してください')
    end

    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include('は全角カタカナで入力してください')
    end
  end
end
