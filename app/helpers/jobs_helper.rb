module JobsHelper
  def safe_apply_url(url)
    return nil if url.blank?

    uri = URI.parse(url)
    uri.to_s if uri.is_a?(URI::HTTP)
  rescue URI::InvalidURIError
    nil
  end
end