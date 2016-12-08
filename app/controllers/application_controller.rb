class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Overwrite unverified request handler to force a refresh / redirect.
  def handle_unverified_request

    authenticate_with_http_digest
  end
end
