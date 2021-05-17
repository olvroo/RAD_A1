class NewsletterMailer < ApplicationMailer
  def welcome_email(email)
	@email = email
    mail(
      to: email,
      subject: 'You are now Subcribed',
      template_path: 'customer/email',
      template_name: 'welcome_email'
    )
  end
end
