# frozen_string_literal: true

module ApplicationHelper

  
    def image_tag(source, options={})
        source = "default.jpg" if source.blank?
        super(source, options)
      end
end
