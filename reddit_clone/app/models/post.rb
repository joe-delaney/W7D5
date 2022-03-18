class Post < ApplicationRecord
  validates :title, :sub_id, :author_id, presence: true

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
end
