ActiveAdmin.register Collection do
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
  permit_params :is_live,
                :name,
                :collectioner_id,
                :description,
                :color_dark,
                :color_light,
                :avatar,
                :pictures_interview,
                :pictures_shooting,
                products_attributes: [
                  :collection_id,
                  :is_live,
                  :name,
                  :description,
                  :price,
                  :picture,
                  :shop_url],
                interviews_attributes: [
                  :question,
                  :answer,
                  :placement,
                  :picture]

  form do |f|
    f.semantic_errors *f.object.errors.keys

    # collectioner
    f.inputs 'COLLECTIONER' do
      f.input :collectioner_id
    end

    # collection
    f.inputs 'COLLECTION' do
      f.input :is_live
      f.input :name
      f.input :color_dark
      f.input :color_light
      f.input :avatar
      f.input :description
    end

    # products
    f.inputs 'PRODUCTS' do
      f.has_many :products do |p|
        p.input :is_live
        p.input :name
        p.input :description
        p.input :price
        p.input :shop_url
        p.input :picture
        p.inputs 'CATEGORIES' do
          p.has_many :categories do |c|
            c.input :lv1_name
            c.input :lv2_name
          end
        end
      end
    end

    # interview
    f.inputs 'INTERVIEW' do
      f.has_many :interviews do |i|
        i.input :question
        i.input :answer
        i.input :placement
        i.input :picture
      end
    end

    f.actions
  end

end
