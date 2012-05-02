# == Schema Information
#
# Table name: credit_cards
#
#  id                 :integer         not null, primary key
#  credit_card_number :string(255)
#  cvc                :string(255)
#  expiration_date    :string(255)
#  user_id            :integer
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#


# Note that credit_card_number is distinct from credit_card.number
class CreditCard < ActiveRecord::Base
  attr_accessible :credit_card_number, :cvc, :expiration_date, :user_id

  VALID_DATE_REGEX = /\d{2}\/\d{4}/
  VALID_CREDIT_CARD_REGEX = /\d{16}/

  validates :credit_card_number, presence: true, 
                                 :allow_blank => false,
                                 format: { with: VALID_CREDIT_CARD_REGEX },
                                 length: { maximum: 20 }
  validates :cvc, presence: true, :allow_blank => false, length: { :is => 3 }
  validates :expiration_date, presence: true,
                              :allow_blank => false,
                              format: { with: VALID_DATE_REGEX }
end
