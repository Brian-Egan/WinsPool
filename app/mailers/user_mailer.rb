class UserMailer < ActionMailer::Base
  default :from => "bfegan@gmail.com"

  def registration_confirmation(user)
  	@user = user
    mail(:to => user.email, :subject => "Registered")
  end

  def draft_notification(user)
  	@user = user
  	@teams = Team.all
    mail(:to => user.email, :subject => "Your turn to draft!")
  end

end
