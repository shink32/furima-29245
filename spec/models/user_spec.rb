require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録'
  before do
    @user = FactoryBot.build(:user)
  end
    it "ニックネームが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email) 
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは@がないと登録できない" do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")

    end
    it "パスワードが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが6文字以上ないと登録できない" do
      @user.password = "11111"
      @user.password_confirmation = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英数字混合でないと登録できない" do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英数字混同で入力してください")
    end
    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名が、名字がないと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名が、名前がないと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名が、名前がないと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）でないと登録できない(名前)" do
      @user.first_name = "aaaa"   
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）でないと登録できない(名字)" do
      @user.last_name = "aaaa"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end

    it "ユーザー本名のフリガナが、名字がないと登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名のフリガナが、名前がないと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "ユーザー本名のふりがなは、全角（カタカナ）でないと登録できない(名前)" do
      @user.first_name_kana = "aaaa"   
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
    end
    it "ユーザー本名のふりがなは、全角（カタカナ）でないと登録できない(名字)" do
      @user.last_name_kana = "aaaa"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい。")
    end
    it "生年月日がないと登録できない" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  
end
