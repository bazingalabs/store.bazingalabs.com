Deface::Override.new(:virtual_path  => "spree/products/show",
                     :name          => "volume_pricing",
                     :insert_before => "[data-hook='cart_form']",
                     :partial          => "shared/volume_pricing")
                     
                     
 Deface::Override.new(:virtual_path  => "spree/products/show",
                     :name => 'change_product_left',
                     :original => '712e77fa6ad239710a68a064a109ec90f13f2b90',
                     :set_attributes => "[data-hook='product_left_part']",
                     :attributes => {:class => 'span4'})
                    
 Deface::Override.new(:virtual_path  => "spree/products/show",
                     :name => 'change_product_right',
                     :original => 'cb09475eb14012ed435ee2774c09a52cd7e9a7ba',
                     :set_attributes => "[data-hook='product_right_part']",
                     :attributes => {:class => 'span5'})
                    
 Deface::Override.new(:virtual_path  => "spree/products/show",
                     :name => 'change_product_right_wrap',
                     :original => 'b64fdbc69ecb9b829b6b81046ab54353ea2e97ed',
                     :set_attributes => "[data-hook='product_right_part_wrap']",
                     :attributes => {:class => 'span4'})
                    

 Deface::Override.new(:virtual_path  => "spree/products/show",
                     :name => 'change_product_show',
                     :original => '44b14b5b1644aff90b9d33dd5156023f0570655a',
                     :set_attributes => "[data-hook='product_show']",
                     :attributes => {:class => 'row'})

 Deface::Override.new(:virtual_path  => "spree/products/cart_form",
                     :name => 'change_add_to_cart_button',
                     #:original => '44b14b5b1644aff90b9d33dd5156023f0570655a',
                     :set_attributes => "code:contains('button_tag')",
                     :attributes => {:class => 'btn btn-primary'})
                