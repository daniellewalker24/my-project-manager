class Project < ActiveRecord::Base
  include Filterable

  belongs_to :brand
  belongs_to :customer
  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'
  has_one :business_address, through: :brand, source: :brand_address
  has_many :account_managements, through: :print_jobs
  has_many :designs, through: :print_jobs
  has_many :discounts
  has_many :invoices
  has_many :job_specifications, through: :print_jobs
  has_many :labour_items, through: :print_jobs
  has_many :mileages, through: :print_jobs
  has_many :print_jobs
  has_many :product_items, through: :print_jobs
  has_many :sundry_items, through: :print_jobs
  has_many :supporting_product_items, through: :print_jobs

  enum status: %w( quoted sold finalised completed )

  validates :brand, presence: true
  validates :customer, presence: true
  validates :name, presence: true

  scope :alphabetical, -> { order(name: :asc) }
  scope :name_search, ->(keywords) { where('projects.name ILIKE ?', "%#{keywords}%").alphabetical if keywords.present? }
  scope :project_type, ->(value) { where(status: value) }
  scope :customer_id, ->(value) { where(customer_id: value) }

  delegate :name, to: :customer, prefix: true, allow_nil: true
  delegate :logo, :colour, :my_brand?, to: :brand
  delegate :vat, :brand_price_inc_vat, :brand_price, :envisage_to_my_price,
    :brand_profit, :envisage_profit, :cost, to: :price_calculator

  def price_calculator
    @price_calculator ||= ProjectPriceCalculator.new(print_jobs: print_jobs, my_brand: my_brand?, discounts: discounts)
  end
end
