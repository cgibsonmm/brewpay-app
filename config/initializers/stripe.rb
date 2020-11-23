require 'stripe'

Stripe.api_key = Rails.application.credentials[:stripe][:stripe_private_api_key]