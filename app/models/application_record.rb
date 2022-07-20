class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Pagy::Backend

  def self.not_found_message
    I18n.t("activerecord.errors.messages.record_not_found", model: self.model_name.human.downcase)
  end
end
