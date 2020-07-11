class Stat

  class << self
    MONTHS = 12
    AVG_ATTENDANCE = 60
    AVG_PIZZAS = 15

    def now
      {
        speakers: speakers,
        talks: talks,
        attendees: attendees,
        impressions: impressions,
        pizzas: pizzas
      }
    end

    private

    def pizzas
      AVG_PIZZAS * MONTHS
    end

    def speakers
      meetings.map do |m|
        m.speakers.pluck(:name)
      end.flatten.count
    end

    def talks
      meetings.map do |m|
        m.speakers.pluck(:title)
      end.flatten.count
    end

    def attendees
      meetings.count * AVG_ATTENDANCE
    end

    def impressions
      meetings.map do |m|
        m.speakers.count * AVG_ATTENDANCE
      end.sum
    end

    def meetings
      range = (MONTHS.months.ago..Date.today)
      @meetings ||= Meeting.includes(:speakers).where(time: range)
    end

  end
end
