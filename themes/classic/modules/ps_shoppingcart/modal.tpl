{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *}
<div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog blockcart-modal-res" role="document" style="width: 84% !important; max-width: 84% !important; margin: 10px auto;">
    <div class="modal-content" style="border-radius: 0; border: none;">
      
      <div class="modal-body" style="padding: 0;">
        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}" style="position: absolute; right: 15px; top: 10px; z-index: 2;">
          <span aria-hidden="true"><i class="material-icons">close</i></span>
        </button>

        <div class="row no-gutters" style="margin: 0;     background-color : #fafafa; width: 100%;">
          
          {* --- PREMIER BLOCK : Produit --- *}
          <div class="col-12 col-md-6" style="padding: 30px; background: #ffffff;padding-bottom: 10px;">
            <h4 class="modal-title h6" style="color: #41ad49; display: flex; align-items: center; margin-bottom: 25px; font-size: 15px;">
              <i class="material-icons" style="margin-right: 10px; font-weight: bold;">check</i>
              {if $language.iso_code == 'fr'}Produit ajouté au panier avec succès{else}Product successfully added to your cart{/if}
            </h4>
            
            <div class="row">
              <div class="col-12 col-md-4" style="margin-bottom: 15px; display: flex; justify-content: center;">
                {if $product.default_image}
                  {* MODIFICATION : Image réduite à 45% de sa colonne *}
                  <img src="{$product.default_image.medium.url}" 
                       alt="{$product.default_image.legend}" 
                       class="product-image" 
                       style="width: 70%; max-width:100% ; height: auto; border: 1px solid #eeeeee;">
                {/if}
              </div>
              <div class="col-12 col-md-8">
                <h6 class="product-name" style="
                    font-size: 15px; 
                    line-height: 23px; 
                    text-align : start;
                    font-weight: 100; 
                    padding: 0; 
                    margin-top: 20px; 
                    text-transform: uppercase;">
                  {$product.name}
                </h6>
                
                {foreach from=$product.attributes item="property_value" key="property"}
                  <p style="margin: 0; font-size: 13px; color: #666;">{$property} : {$property_value}</p>
                {/foreach}

                <p style="margin: 0; font-size: 13px; margin-top: 5px;">
                    <span style="font-weight: 600;">{if $language.iso_code == 'fr'}Quantité :{else}Quantity:{/if}</span> 
                    <span>{$product.cart_quantity}</span>
                </p>

                <p style="font-weight: 600; font-size: 13px; margin-top: 5px;">{if $language.iso_code == 'fr'}Total :{else}Total:{/if} {$product.price}</p>
              </div>
            </div>
          </div>

          {* --- DEUXIEME BLOCK : Récapitulatif --- *}
          <div class="col-12 col-md-6" style="padding: 30px; background: #fafafa; border-left: 1px solid #ebebeb;">
            <div class="cart-content">
              <p style="border-bottom: 1px solid #ddd; padding: 0; color: #333; font-size: 18px; margin-bottom: 15px;">
                {if $language.iso_code == 'fr'}
                  {l s='Il y a %products_count% produits dans votre panier.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}
                {else}
                  {l s='There are %products_count% products in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}
                {/if}
              </p>
              
              <div style="display: flex; justify-content: flex-start; gap: 5px; margin-bottom: 5px; font-size: 13px;">
                <span style="color: #333;font-weight: bold;">{if $language.iso_code == 'fr'}Total produits{else}Products total{/if}</span>
                <span style="color: #777;">{$cart.subtotals.products.value}</span>
              </div>
              <div style="display: flex; justify-content: flex-start; gap: 5px; margin-bottom: 5px; font-size: 13px;">
                {if isset($cart.subtotals.shipping)}
                    <span style="color: #333;font-weight: bold;">
                        {$cart.subtotals.shipping.label}
                    </span>
                    <span style="color: #777;">
                        {$cart.subtotals.shipping.value}
                    </span>
                {/if}
              </div>
              <div style="display: flex; justify-content: flex-start; gap: 5px; margin-bottom: 15px; font-size: 13px;">
                <span style="color: #333;font-weight: bold;">{if $language.iso_code == 'fr'}Total{else}Total{/if}</span>
                <span style="color: #777;">{$cart.totals.total.value}</span>
              </div>

              <div style="display: flex; gap: 10px; justify-content: flex-start; align-items: center; flex-wrap: wrap; margin-top: 40px;">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background: white; color: #333; border: 1px solid #ccc; border-radius: 0; padding: 10px 15px; font-size: 13px; display: flex; align-items: center; text-transform: none;">
                  <i class="material-icons" style="font-size: 18px; margin-right: 5px;">chevron_left</i> {if $language.iso_code == 'fr'}Continuer mes achats{else}Continue shopping{/if}
                </button>
                <a href="{$cart_url}" class="btn btn-primary" style="background-color: #f02d32; border: none; border-radius: 0; color: white; padding: 10px 20px; font-size: 13px; font-weight: bold; display: flex; align-items: center; text-transform: none;">
                  {if $language.iso_code == 'fr'}Commander{else}Checkout{/if} <i class="material-icons" style="font-size: 18px; margin-left: 5px;">chevron_right</i>
                </a>
              </div>
            </div>
          </div>

        </div>
        {hook h='displayProductAddonsInModal' product=$product}
      </div>
    </div>
  </div>
</div>

<style>
@media (max-width: 767px) {
  .blockcart-modal-res {
    width: 95% !important;
    max-width: 95% !important;
    margin: 10px auto !important;
  }
  .modal-body .row.no-gutters .col-md-6 {
    border-left: none !important;
    border-top: 1px solid #ebebeb !important;
  }
}
p,
span {
  font-family: Arial, Helvetica, sans-serif;
}
</style>