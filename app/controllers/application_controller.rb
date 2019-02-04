class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # def after_sign_in_path_for(resource)
  #   "/users/#{current_user.id}/"
  # end

  # rescue_from ActiveRecord::StatementInvalid, with: :render_404

  # def render_404(e = nil)
  #   if e
  #     logger.error e
  #     logger.error e.backtrace.join("\n")
  #   end

  #   render template: 'errors/error404', status: 404, layout: 'application', content_type: 'text/html'
  # end

  unless Rails.env.development?
    rescue_from Exception,                        with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
    rescue_from ActionController::RoutingError,   with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  def _render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.format.to_sym == :json
render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'

    else
render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'

    end
  end

  def _render_500(e = nil)
    logger.error "Rendering 500 with exception: #{e.message}" if e
    Airbrake.notify(e) if e # Airbrake/Errbitを使う場合はこちら

    if request.format.to_sym == :json
render file: Rails.root.join('public/500.html'), status: 404, layout: false, content_type: 'text/html'

    else
render file: Rails.root.join('public/500.html'), status: 404, layout: false, content_type: 'text/html'

    end
  end
end
