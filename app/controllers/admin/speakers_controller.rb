class Admin::SpeakersController < AdminController
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]

  # GET /speakers
  def index
    @speakers = Speaker.all.joins(:meeting).order('meetings.time desc').group_by(&:meeting)
  end

  # GET /speakers/1
  def show
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers
  def create
    @speaker = Speaker.new(speaker_params)

    if @speaker.save
      redirect_to admin_speaker_path(@speaker), notice: 'Speaker was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /speakers/1
  def update
    if @speaker.update(speaker_params)
      redirect_to admin_speaker_path(@speaker), notice: 'Speaker was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /speakers/1
  def destroy
    @speaker.destroy
    redirect_to admin_speakers_url, notice: 'Speaker was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    def set_header
      @header = "Speakers"
      @current_section = :speakers
    end

    # Only allow a trusted parameter "white list" through.
    def speaker_params
      params.require(:speaker).permit(:name, :title, :url, :meeting_id)
    end
end
