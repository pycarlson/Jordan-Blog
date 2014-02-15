module ApplicationHelper
  def administrator?(user)
    user.email == "jpluftig@hotmail.com"
  end
end
