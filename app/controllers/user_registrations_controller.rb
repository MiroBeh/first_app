class UserRegistationsController < Devise::RegistationsController

  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end


end
