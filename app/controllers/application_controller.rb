class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  
  def after_sign_in_path_for(resource) 
    posts_path
  end

  def category_action
    @category_kind = Category.where("id <= ?", 19)
    @category_character = Category.where("id >= ?", 20).where("id <= ?", 27)
    @category_age = Category.where("id >= ?", 28).where("id <= ?", 40)
    @category_gender = Category.where("id >= ?", 40).where("id <= ?", 42)
    @category_vaccination = Category.where("id >= ?", 43).where("id <= ?", 44)
  end
end
