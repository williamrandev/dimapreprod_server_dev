{block name='product_attributes_selection'}

    {* Sélection de la couleur *}
    {if isset($product.colors) && $product.colors|@count > 0}
      <div class="product-colors" style="margin-top: 20px;">
        <label><strong>SÉLECTIONNER UN COLORIS</strong></label><br>
        <div style="display: flex; gap: 10px; margin-top: 5px;">
          {foreach from=$product.colors item=color}
            <div 
              class="color-option" 
              style="width: 25px; height: 25px; background-color: {$color.value}; border: 1px solid #ccc; cursor: pointer;"
              data-color="{$color.id_attribute}"
              title="{$color.name}"
            ></div>
          {/foreach}
        </div>
      </div>
    {/if}
  
    {* Sélection de la dimension *}
    {if isset($product.dimensions) && $product.dimensions|@count > 0}
      <div class="product-dimensions" style="margin-top: 15px;">
        <label><strong>SÉLECTIONNER UNE DIMENSION</strong></label><br>
        <select name="dimension" id="dimension-select" style="margin-top: 5px; padding: 5px;">
          {foreach from=$product.dimensions item=dimension}
            <option value="{$dimension.id_attribute}">{$dimension.name}</option>
          {/foreach}
        </select>
      </div>
    {/if}
  
  {/block}
  