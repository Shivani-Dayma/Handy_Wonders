class Order < ApplicationRecord
    belongs_to :account
    has_one :cart,dependent: :destroy

end
