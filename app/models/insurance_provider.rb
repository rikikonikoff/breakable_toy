class InsuranceProvider < ApplicationRecord
  belongs_to :insurer
  belongs_to :provider, optional: true
  belongs_to :user, optional: true

  validates :insurer_id, presence: true
  validates_uniqueness_of :provider, scope: [:insurer]
  validates_uniqueness_of :user, scope: [:insurer]
end
