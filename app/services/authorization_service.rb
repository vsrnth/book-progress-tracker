# frozen_string_literal: true

class AuthorizationService
  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  private

  def http_token
    return unless @headers['Authorization'].present?

    @headers['Authorization'].split(' ').last
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end
end
