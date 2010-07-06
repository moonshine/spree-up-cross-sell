class UpCrossSellHooks < Spree::ThemeSupport::HookListener

  # Add menu tab for up/cross sells when editing a product
  insert_after :admin_product_tabs, :partial => 'admin/shared/up_cross_sell_tab'

end
