module ApplicationHelper
  def formatted_date(date)
    date.strftime("%A, %m/%d/%Y at %l:%M%P")
  end

  def meeting_format(name)
    case name
    when "Class" then "Open Hack Night"
    when "Fishbowl" then "Fishbowl!!"
    when "Lecture" then "Lecture"
    end
  end

  def twitter_handle(handle)
    if handle.present?
      "https://twitter.com/#{handle}"
    end
  end

  def color_section(current_section, section, color)
    if current_section == section
      "border-#{color}
    end
  end
end
