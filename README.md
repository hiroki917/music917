# データベース設計

## users テーブル

| Column                       | Type    | Options                  |
| -----------------------------| --------|--------------------------|
| name                         | string  | null: false              |
| age                          | integer | null: false              |
| first_name                   | string  | null: false              |
| last_name                    | string  | null: false              |
| first_name_kana              | string  | null: false              |
| last_name_kana               | string  | null: false              |
| email                        | string  | null: false,unique: true |
| encrypted_password           | string  | null: false              |
| birth_day                    | date    | null: false              |

###  Association

- has_many :musics
- has_many :comments


## musics テーブル

| Column                | Type         | Options                          |
| ----------------------| -------------|----------------------------------|
| name                  | string       | null: false                      |
| phrase                | string       | null :false                      |
| genre_id              | integer      | null :false                      |
| text                  | text         | null :false                      |
| user                  | references   | null: false, foreign_key: true   | 

## Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column                | Type         | Options                          |
| ----------------------| -------------|----------------------------------|
| text                  | text         | null :false                      |
| user                  | references   | null: false, foreign_key: true   | 
| music                 | references   | null: false, foreign_key: true   | 

## Association

- belongs_to :user
- belongs_to :music