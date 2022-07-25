class WeatherController < ApplicationController
    before_action :set_locale

    def set_locale
      I18n.locale = params[:locale] || 'en'
    end

    def temperature
        raise head(:unprocessable_entity) && return unless params[:degrees]
        @result = TemperatureCreator.call(params[:locale], params[:degrees])
        render json: ({description: @result})
      end

    def wind
        raise head(:unprocessable_entity) && return unless params[:wind_speed]
        @result = WindCreator.call(params[:locale], params[:wind_speed])
        render json: ({description: @result})
    end

    def clouds
        raise head(:unprocessable_entity) && return unless params[:clouds]
        @result = CloudsCreator.call(params[:locale], params[:clouds])
        render json: ({description: @result})
     end
end

private 
    def temperature_params
    params.permit(:locale, :degrees)
end

private 
    def wind_params
    params.permit(:locale, :wind_speed)
end

private 
    def cloud_params
    params.permit(:locale, :clouds)
end