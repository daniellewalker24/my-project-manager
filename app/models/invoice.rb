class Invoice < ActiveRecord::Base
  belongs_to :project
  has_one :customer, through: :project
  has_one :brand, through: :project

  delegate :name, to: :customer, prefix: true
  delegate :name, to: :project, prefix: true
  delegate :prefix, to: :brand, prefix: true

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  after_create :save! # to generate slug, bleugh!

  def slug_candidates
    [
      :number
    ]
  end

  def should_generate_new_friendly_id?
    !new_record? && slug.nil?
  end

  def unpaid?
    !paid?
  end

  def vat
    @vat ||= amount * 0.2
  end

  def total_inc_vat
    amount + vat
  end

  def number
    "#{ brand_prefix }#{ id + 500 }"
  end


end