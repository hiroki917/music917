require 'rails_helper'

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
  end

  describe 'フレーズ投稿' do
    context '新規登録できるとき' do
      it '全ての値が存在すれば登録できること' do
        expect(@music).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'nameが空だと保存できない時' do
       @music.name = ''
       @music.valid?
       expect(@music.errors.full_messages).to include("Name can't be blank")
      end
      it 'phraseが空では登録できない' do
        @music.phrase = ''
        @music.valid?
        expect(@music.errors.full_messages).to include("Phrase can't be blank")
      end
      it 'textが空では登録できない' do
        @music.text = ''
        @music.valid?
        expect(@music.errors.full_messages).to include("Text can't be blank")
      end
      it 'genre_idが空では登録できない' do
        @music.genre_id = ''
        @music.valid?
        expect(@music.errors.full_messages).to include("Genre can't be blank")
      end
      it 'imageが空では登録できない' do
        @music.image = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていなければ登録できない' do
        @music.user = nil
        @music.valid?
        expect(@music.errors.full_messages).to include('User must exist')
      end

    end
    # ミスend
  end
# disend
end
# rsend