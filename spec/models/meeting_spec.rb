require "rails_helper"

RSpec.describe Meeting do
  describe "Auto-creating next meeting" do
    it "should create a meeting in the future if meetings exist" do
      Meeting.find_or_create_next_date
      second_meeting = Meeting.find_or_create_next_date

      expect(second_meeting.time).to be >= Date.today
    end

    it "should create a meeting in the future if no meetings exist" do
      meeting = Meeting.find_or_create_next_date
      expect(meeting.time).to be >= Date.today
    end
  end
end
