require "promocode_generator/version"
require "promocode_generator/model_additions"
require "promocode_generator/railtie" if defined? Rails

module PromocodeGenerator
  # Generates an 8 character random code of uppercase letters and numbers
  # It explicitly excludes the letters I, L, O and the number 0 to avoid
  # confusion
  def self.generate(length = 8)
    [('A'..'Z').to_a - ['I', 'L', 'O'], ('1'..'9').to_a].flatten.shuffle[0,length].join
  end
end
