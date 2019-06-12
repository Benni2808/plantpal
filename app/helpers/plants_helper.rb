module PlantsHelper
  def get_error_for(plant, fieldname)
    plant&.errors&.messages[fieldname].join(" und ")
    end
end
