ActiveAdmin.register Ad do
  index do
    selectable_column
    column :ad_type, :sortable => true do |ad|
      link_to Ad.ids[ad.ad_type], wojiudiaochuo_ad_path(ad)
    end
    column :finished_at
  end


  form do |f|
    f.inputs do
      f.input :content
      f.input :ad_type, collection: Ad.types, include_blank: false
    end
    f.actions
  end
end