class PresentationsController < ApplicationController
  before_action :correct_member,                  only: [:edit, :update]
  before_action :admin_member,                    only: [:new, :create, :destroy]

  def index
    @presentations = Presentation.paginate(page: params[:page])
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    if @presentation.save
      flash[:success] = "Created new presentation."
      redirect_to @presentation
    else
      render 'new'
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update_attributes(presentation_params)
      flash[:success] = "Presentation updated."
      redirect_to @presentation
    else
      render 'edit'
    end
  end

  def destroy
    Presentation.find(params[:id]).destroy
    flash[:success] = "Presentation deleted."
    redirect_to presentations_url
  end

  private

    def presentation_params
      params.require(:presentation).permit(:title, :member_id, :meeting_id, :description, :slides, :video)
    end

    def correct_member
      @presentation = current_member.presentations.find_by(id: params[:id])
      redirect_to root_url if @presentation.nil? && !current_member.admin?
    end
end