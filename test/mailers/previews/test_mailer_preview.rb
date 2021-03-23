class TestMailer < ApplicationMailer
  default from: 'quentin@soubeyrol.com'

  def hello
    mail(
      subject: 'Hello from Postmark',
      to: 'quentin@soubeyrol.com',
      from: 'quentin@soubeyrol.com',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'outbound')
  end
end
