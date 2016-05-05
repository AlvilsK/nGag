module ApplicationHelper

  page_title = ("")
  base_title = ("nGag")
  if page_title.empty?
    base_title
  else
    ( "#{page_title}" | "#{base_title}" )
  end
end
