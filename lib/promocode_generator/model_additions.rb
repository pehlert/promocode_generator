module PromocodeGenerator
  module ModelAdditions
    def promocode_attribute(attribute, options = {})
      options[:reject_if] ||= Proc.new { |code| self.where(attribute => code).any? }

      before_create do
        # Make sure not to generate the same code twice!
        begin
          self.code = PromocodeGenerator.generate
        end while options[:reject_if].call(code)
      end 
    end
  end
end
