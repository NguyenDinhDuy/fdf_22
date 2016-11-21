class UserMailer < ApplicationMailer

  def new_order user, order
    @user = user
    @order = order
    mail to: user.email, subject: t("mailer.new_order")
  end
end