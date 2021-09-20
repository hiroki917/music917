require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空だと登録できない時' do
       @user.name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'ageが空では登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性出ないと登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、半角英字が必須であること' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードは、半角数字が必須であること' do
        @user.password = 'eeeeee'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_name_kanaが全角カナ以外では登録できない' do
        @user.first_name_kana = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana  is invalid. Input full-width characters')
      end
      it 'last_kanaが全角カナ文字カナ以外では登録できない' do
        @user.first_name_kana = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana  is invalid. Input full-width characters')
      end
      it 'first_nameが全角文字以外では登録できない' do
        @user.first_name = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name  is invalid. Input full-width characters')
      end
      it 'last_nameが全角文字で以外では登録できない' do
        @user.last_name = 'ｱｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name  is invalid. Input full-width characters')
      end
      it '全角文字を含むパスワードでは登録出来ない' do
        @user.password = 'ａ11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'が空では登録できない' do
        @user. = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it 'が空では登録できない' do
        @user. = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
    end
  end
end