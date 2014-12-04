module ApplicationHelper
  def formatted_date(date)
    date.strftime("%A, %m/%d/%Y at %l:%M%P")
  end
  def short_date(date)
    date.strftime("%B %d, %Y")
  end
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Columbus Ruby Brigade"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
