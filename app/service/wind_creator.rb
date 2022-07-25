class WindCreator < ApplicationService
    attr_reader :locale
    attr_reader :wind_speed

    def initialize(locale, wind_speed)
      @locale = locale
      @wind_speed = Integer(wind_speed)
    end

    def call
        return create_response
    end
  
    private
        def create_response
            @result = 
                case @wind_speed
                    when ..2
                        I18n.t 'wind.none'
                    when 3..7
                        I18n.t 'wind.weak'
                    when 8..19
                        I18n.t 'wind.medium'
                    when 20..Float::INFINITY
                        I18n.t 'wind.strong'
                    else
                        "You gave me #{@wind_speed} -- I have no idea what to do with that."
                    end
        return @result;
    end
end
