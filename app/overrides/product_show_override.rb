Deface::Override.new(:virtual_path  => "spree/products/show",
                     :insert_before => "div#product-description",
                     :partial          => "shared/volume_pricing",
                     :name          => "volume_pricing")