module ApplicationHelper
  def current_language
    if I18n.locale =~ /^es.*/
      "spanish"
    else
      "english"
    end
  end
end
