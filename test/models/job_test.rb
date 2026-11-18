require "test_helper"

class JobTest < ActiveSupport::TestCase
  test "should be valid with apply_email and apply_url" do
    job = Job.new apply_url: 'https://www.google.com'
    job.valid?
    assert_empty(job.errors[:base])

    job = Job.new apply_email: 'test@example.com'
    job.valid?
    assert_empty(job.errors[:base])

    job = Job.new
    job.valid?
    assert_includes(job.errors[:base], "Must provide either apply_email or apply_url")
    
  end
  # test "the truth" do
  #   assert true
  # end
end
