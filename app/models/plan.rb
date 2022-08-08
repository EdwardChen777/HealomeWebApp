class Plan < ApplicationRecord
    has_many :plan_prices

    scope :alphabetical, -> { order(:name) }

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    def current_retail_price
        curr = self.plan_prices.current.first
        if curr.nil?
          return nil
        else
          return curr.price
        end
    end
    
    def retail_price_on_date(date)
        data = self.plan_prices.for_date(date).first
        if data.nil?
          return nil
        else
          return data.price
        end
    end
end
