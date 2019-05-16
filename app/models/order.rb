class Order < ActiveRecord::Base

  after_create :send_email

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  private

  def send_email
    UserMailer.order_email(self).deliver
  end
end
