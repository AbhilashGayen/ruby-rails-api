class CloudsCreator < ApplicationService
    attr_reader :locale
    attr_reader :clouds

    def initialize(locale, clouds)
      @locale = locale
      @clouds = Integer(clouds)
    end

    def call
        return create_response
    end
  
    private
        def create_response
            @result = 
                case @clouds
                    when ..10
                        I18n.t 'clouds.none'
                    when 11..70
                        I18n.t 'clouds.partial'
                    when 71..Float::INFINITY
                        I18n.t 'clouds.full'
                    else
                        "You gave me #{@clouds} -- I have no idea what to do with that."
                    end
        return @result;
    end
end
