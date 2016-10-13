class ReceiptMailerPreview < ActionMailer::Preview

  def order_mail_preview
    order = Order.first
    user = User.first
    ReceiptMailer.order_email(order, user)
  end

end
