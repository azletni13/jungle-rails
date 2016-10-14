Rails.configuration.stripe = {
  :publishable_key => ENV['username'],
  :secret_key      => ENV['password']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
