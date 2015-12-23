class SampleMailer < ApplicationMailer
  def send_when_update(user, good)
    @user = user
    @good = good
    mail to: user.email , subject: "#{good.name}の在庫数が少なくなっています"
  end
end
