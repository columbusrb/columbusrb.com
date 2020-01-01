class Admin::SessionsController < Devise::SessionsController
  layout false

  # GET /admin/sign_in
  def new
    super
  end

  # POST /admin/sign_in
  def create
    super
  end

  # DELETE /admin/sign_out
  def destroy
    super
  end

  def failure
    redirect_to root_url
  end

  def google_oauth2
    auth_hash = request.env['omniauth.auth']
    user = AdminUser.from_omniauth(auth_hash)
    sign_in(user)

    redirect_to admin_path
  end
end
