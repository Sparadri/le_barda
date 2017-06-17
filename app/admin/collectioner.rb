ActiveAdmin.register Collectioner do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :shop_url, :first_name, :last_name, :email, :facebook_url, :twitter_url, :instagram_url, :pinterest_url,
    collections_attributes: [:is_live, :name, :description, :color_dark, :color_light, :avatar, :pictures_interview, :pictures_shooting]
end
