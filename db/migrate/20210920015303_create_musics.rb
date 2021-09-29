class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string      :name,               null: false
      t.string      :phrase,             null: false
      t.integer     :genre_id,           null: false
      t.text        :text,               null: false
      t.references  :user,               null: false, foreign_key: true, dependent: :delete
      t.timestamps
    end
  end
end
