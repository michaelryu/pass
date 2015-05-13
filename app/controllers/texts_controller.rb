class TextsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_text
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+1 (604) 337-1201', to: '+1 (604) 442-5456', body: 'This is the stuff bro'
  end
end
