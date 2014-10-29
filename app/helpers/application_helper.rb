module ApplicationHelper
  def format_datetime(datetime)
   datetime.nil? ? '' :  datetime.localtime.strftime("%Y-%m-%d %H:%M:%S")
  end
end
