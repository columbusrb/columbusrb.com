class Stat

  class << self
    START_DATE = { 12.months.ago }

    def speakers
      @meetings.speakers.pluck(:name).uniq
    end

    def talks
    end

    def attendees
    end

    def impressions
    end

    private

    def meetings
      range = (START_DATE..Date.today)
      @meetings ||= Meeting.includes(:speakers).where(time: range)
    end

  end
end
