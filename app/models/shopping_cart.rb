# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ActiveRecord::Base
  has_many :products, through: :in_shopping_carts
  has_many :in_shopping_carts
  has_many :my_payments
  include AASM
  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed

    event :pay do
      after do
        generate_links()
      end
      transitions from: :created, to: :payed
    end

  end
  def payment
    begin
      my_payments.payed.first
    rescue Exception => e
      nil
    end  
  end
  def generate_links
    self.products.each do |product|
      Link.create(expiration_date: DateTime.now + 7.days, product: product, email: payment.email)
    end
  end

  def total
    products.sum(:pricing)
  end

  def items
    self.products.map{ |product| product.paypal_form }
  end

end
