module ApplicationHelper
  def default_meta_tags
    if controller_name == 'home'
      name = "#{t('site_title')}"
    else
      name = "#{t("action.#{controller_name}.#{action_name}")} | #{t('site_title')}"
    end
    {
      :site       => name,
      :description => t('site_desc'),
      :keywords    => t('site_keywords'),
      reverse: true
    }
  end

  def ad(ad_type)
    Ad.send(ad_type).try(:content).try(:html_safe)
  end
end
