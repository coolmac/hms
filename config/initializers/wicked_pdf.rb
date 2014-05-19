# WickedPdf.config = {
# 	:exe_path => '/usr/bin/wkhtmltopdf'
# }

if Rails.env.staging? || Rails.env.production?
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf"
else
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf"
  # exe_path = '/usr/local/bin/wkhtmltopdf'
end
WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path }