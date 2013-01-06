module ApplicationHelper
  def show_date(date, format = '%d %b %Y')
    return "" if date.nil?
    date.strftime(format)
  end
end
