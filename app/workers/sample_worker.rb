class SampleWorker
  include Sidekiq::Worker

  def perform(user_id, good_id)
    user = User.find(user_id)
    good = Good.find(good_id)
    SampleMailer.send_when_update(user,good).deliver
  end
end
