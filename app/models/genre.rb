class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ロック' },
    { id: 3, name: 'ブルース' },
    { id: 4, name: 'ジャズ' },
    { id: 5, name: 'ファンク' },
    { id: 6, name: 'ラテン' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
  
  end