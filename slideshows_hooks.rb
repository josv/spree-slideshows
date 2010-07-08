class SlideshowsHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_configurations_menu do
    %(<%= configurations_menu_item t('slideshow_slides'), admin_slides_path, t("manage_slideshow") %>)
  end

end
