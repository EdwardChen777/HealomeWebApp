class PlanPrice < ApplicationRecord
  belongs_to :plan

  scope :current,       -> { where(end_date:nil) }
  scope :chronological, -> { order(start_date: :desc ) }
  scope :for_date,      ->(date) { where("start_date <= ? AND (end_date >= ? OR end_date IS NULL)", date, date) }
  scope :for_plan,      ->(item_id) { where(plan_id: plan_id) }

  validates_numericality_of :price, greater_than_or_equal_to: 0

  before_create do
    set_end_date_of_old_price()
    set_start_date_to_tomorrow()
  end

  private
  def set_end_date_of_old_price
    previous = PlanPrice.current.for_item(self.plan_id).take
    previous.update_attribute(:end_date, Date.current) unless previous.nil?
  end

  def set_start_date_to_tomorrow
    self.start_date = Date.tomorrow
  end
end
