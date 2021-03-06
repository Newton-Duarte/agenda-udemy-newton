class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address
  has_many :phones

  validates :name, :email, presence: true

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
