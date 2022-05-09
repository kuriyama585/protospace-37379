class Comment < ApplicationRecord
  belongs_to :prototype  # prottypeテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

  validates :text, presence: true
  # バリデーションにはカラムが入る
end
