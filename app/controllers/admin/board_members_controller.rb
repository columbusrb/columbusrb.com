class Admin::BoardMembersController < AdminController
  def index
    @members = BoardMember.all
  end

  def show
    @member = BoardMember.find(params[:id])
  end

  def new
    @member = BoardMember.new
  end

  def create
    @member = BoardMember.new(member_params)

    if @member.save
      redirect_to admin_board_members_path, notice: "#{@member.name} added to the Board of Directors, long may they reign."
    else
      render :new
    end
  end

  def edit
    @member = BoardMember.find(params[:id])
  end

  def update
    @member = BoardMember.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member), notice: "#{@member.name} details have been updated."
    else
      render :edit
    end
  end

  def destroy
    @member = BoardMember.find(params[:id])
    @member.destroy
    redirect_to admin_board_members_url, notice: "#{@member.name} was removed from the board. They will be missed."
  end

  private

  def set_header
    @header = 'Board Members'
  end

  def member_params
    params.require(:board_member)
          .permit(:name, :title, :twitter, :bio, :director)
  end
end
