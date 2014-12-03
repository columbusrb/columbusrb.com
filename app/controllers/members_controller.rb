class MembersController < ApplicationController
  before_action :signed_in_member,                only: [:index, :edit, :update, :destroy]
  before_action :correct_member, :admin_member,   only: [:edit, :update]
  before_action :admin_member,                    only: :destroy

  def index
    @members = Member.search(params[:search], params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    @member = Member.new(member_params)
    if verify_recaptcha(model: @member, message: captcha_message) && @member.save
      sign_in @member
      flash[:success] = "Welcome to the CRB!"
      redirect_to @member
    else
      render 'new'
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member deleted."
    redirect_to members_url
  end

  def edit
  end

  def update
    if @member.update_attributes(member_params)
      flash[:success] = "Profile updated"
      redirect_to @member
    else
      render 'edit'
    end
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password,
                                     :password_confirmation, :github,
                                     :twitter, :website, :bio)
    end

    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless current_member?(@member) || current_member.admin?
    end
end