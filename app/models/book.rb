class Book < ApplicationRecord
  belongs_to :user # commit 79b3044で修正済み
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
