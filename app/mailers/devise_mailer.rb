class DeviseMailer < Devise::Mailer
  default from: "genauth.pvt.ltd@gmail.com"

  @@MAIL_OPTIONS = {
    "from" => 'Admin GenAuth <admin@genauth.com>',
    "delivery_method" => 'smtp',
    "smtp_settings.enable_starttls_auto" => 'true',
    "smtp_settings.address" => "smtp.gmail.com",
    "smtp_settings.port" => '587',
    "smtp_settings.domain" => "genauth.com",
    "smtp_settings.authentication" => 'plain',
    "smtp_settings.user_name" => 'genauthpvtltd@gmail.com',
    "smtp_settings.password"  => 'htuaneg123'
  }
  
  # def confirmation_instructions(record, opts={})
  #   super(record, @@MAIL_OPTIONS)
  # end
  
  # def reset_password_instructions(record, opts={})
  #   super(record, @@MAIL_OPTIONS)
  # end
  
  def request_registration(request_email)
    @request_email = request_email
    mail_options = @@MAIL_OPTIONS
    mail_options[:to] = 'admin@genauth.com'
    mail_options[:subject] = "New Registration request from #{request_email}"
    mail(mail_options)
  end

  def test_mail(email_id)
  	mail_options = @@MAIL_OPTIONS
  	mail_options[:to] = email_id
  	mail_options[:subject] = 'Testing EMR rails application'
  	mail(mail_options)
  end  


end
