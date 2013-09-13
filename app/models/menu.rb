class Menu < ActiveRecord::Base
  validates :name, :start_at, :presence => true
  before_save :end_date_must_be_after_start_date
  before_save :titilize_title
  has_many :menu_items

  private

  def end_date_must_be_after_start_date
    if !(self.end_at > self.start_at)
      errors.add(:end_at, "end date must be after start date")
    end
  end

  def titilize_title
    self.name.gsub! '-', ' '
  end
end
