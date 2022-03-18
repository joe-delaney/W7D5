class Post < ApplicationRecord
  validates :title, :author_id, presence: true
  validate :has_one_sub?

  # belongs_to :sub,
  #   foreign_key: :sub_id,
  #   class_name: :Sub

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs,
    foreign_key: :post_id,
    class_name: :PostSub
  
  has_many :subs,
    through: :post_subs,
    source: :sub

  def has_one_sub?
    # debugger
    unless self.post_subs.length > 0
      self.errors.add :Please, " select at least one sub"
    end
  end
end
