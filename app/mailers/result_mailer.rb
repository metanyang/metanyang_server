class ResultMailer < ApplicationMailer
  default from: 'master@blancat.com'

  def result_mail(result_mail)
    @result_mail = result_mail
    @sponsership = result_mail.sponsership
    attachments.inline['image'] = File.read("#{Rails.root}/public#{@result_mail.image}")
    mail(to: @sponsership.email, subject: "BlanCat입니다. 당신의 #{@sponsership.good.name}이(가) 잘 전달되었습니다.")
  end


end
