module PromocodeGenerator
  class Railtie < Rails::Railtie
    initializer 'promocode_generator.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end
