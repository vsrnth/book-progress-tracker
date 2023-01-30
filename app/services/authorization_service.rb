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
		if @headers['Authorization'].present?
			@headers['Authorization'].split(' ').last
		end
	end

	def verify_token
		JsonWebToken.verify(http_token)
	end
end