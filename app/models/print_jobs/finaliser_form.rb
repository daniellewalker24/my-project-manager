class PrintJobs::FinaliserForm
  include ActiveModel::Model

  attr_accessor :envisage_sale_price, :envisage_trade_sale_price,
    :envisage_to_my_sale_price, :my_sale_price

  validates :envisage_sale_price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :envisage_trade_sale_price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :envisage_to_my_sale_price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :my_sale_price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  def initialize(print_job, attributes = {})
    @print_job = print_job
    super(attributes)
  end

  def name
    print_job.name
  end

  def save!
    print_job.update!({
      cost: print_job.cost,
      envisage_sale_price: envisage_sale_price,
      envisage_trade_sale_price: envisage_trade_sale_price,
      envisage_to_my_sale_price: envisage_to_my_sale_price,
      my_sale_price: my_sale_price,
      my_service_item_costs: my_service_items_costs,
    })
  end

  def update(attributes = {})
    return unless attributes
    attributes.each do |attr, value|
      public_send("#{ attr }=", value)
    end
  end

  private

  attr_reader :print_job

  def my_service_items
    print_job.my_service_items
  end

  def my_service_items_costs
    my_service_items.sum(:cost)
  end

end
