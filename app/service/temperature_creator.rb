class TemperatureCreator < ApplicationService
    attr_reader :locale
    attr_reader :degrees

    def initialize(locale, degrees)
      @locale = locale
      @degrees = Integer(degrees)
    end

    def call
        return create_response
    end
  
private
    def create_response
        @result = 
        if @degrees < 0
            I18n.t('temperature.below_zero', degrees: @degrees)
        else
            I18n.t('temperature.above_zero', degrees: @degrees)
        end
        return @result;
    end
end
