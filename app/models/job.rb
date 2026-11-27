class Job < ApplicationRecord
  belongs_to :user, optional: true
  
  has_rich_text :description
  
  validates :title, :company, :salary, :region, presence: true
  validates :apply_url,
            format: {
              with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
              message: "must be a valid HTTP or HTTPS URL"
            },
            allow_blank: true

  validate :has_apply_method

  def has_apply_method
    unless apply_url? || apply_email?
      errors.add(:base, "Please provide an apply URL or email")
    end
  end
  # to_param :title
  # to_param :title_and_company

  def to_param
    [id, title, 'at', company].join("-").parameterize
  end
end