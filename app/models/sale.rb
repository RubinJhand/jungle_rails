class Sale < ActiveRecord::Base

  validates :name, presence: true, length: { minimum: 3}
  validates :percent_off, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true

  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

    def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
