class Plan < ApplicationRecord
    has_many :plan_prices

    scope :alphabetical, -> { order(:name) }
    scope :allows_blood_tests,     -> { where(has_blood_tests: true) }
    scope :allows_past_results,     -> { where(can_upload_past_results: true) }
    scope :allows_wearables,     -> { where(includes_wearables: true) }

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates_numericality_of :biomarkers, only_integer: true, greater_than_or_equal_to: 0

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
