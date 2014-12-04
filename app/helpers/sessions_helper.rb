module SessionsHelper

  def sign_in(member)
    remember_token = Member.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    member.update_attribute(:remember_token, Member.digest(remember_token))
    self.current_member = member
  end

  def signed_in?
    !current_member.nil?
  end

  def current_member=(member)
    member == current_member
  end

  def signed_in_member
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def current_member
    remember_token = Member.digest(cookies[:remember_token])
    @current_member ||= Member.find_by(remember_token: remember_token)
  end

  def current_member?(member)
    member == current_member
  end

  def sign_out
    current_member.update_attribute(:remember_token,
                                    Member.digest(Member.new_remember_token))
    cookies.delete(:remember_token)
    self.current_member = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def admin_member                                                                       
    redirect_to(root_url) unless current_member.admin?
  end
end
