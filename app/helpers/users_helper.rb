module UsersHelper
  def get_error_for_user(resource, fieldname)
    resource&.errors&.messages[fieldname].join(" und ")
  end
end
