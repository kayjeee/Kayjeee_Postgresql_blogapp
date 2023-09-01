# ApplicationRecord is the base class for all models in the application.
# It inherits from ActiveRecord::Base and provides common functionality
# that should be shared among all models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
