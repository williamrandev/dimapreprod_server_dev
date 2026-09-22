{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
      <ul class="top-menu container sub_menu_edit{$depth}" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
        {foreach from=$nodes item=node}
            <li class="{$node.type}{if $node.current} current {/if}" id="{$node.page_identifier}">
            {assign var=_counter value=$_counter+1}
              <a
                class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1} dropdown-submenu{/if}"
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}
              >
                {if $node.children|count}
                  {* Cannot use page identifier as we can have the same page several times *}
                  {assign var=_expand_id value=10|mt_rand:100000}
                  <span class="float-xs-right hidden-md-up">
                    <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons">
                      <i class="material-icons add">&#xE313;</i>
                      <i class="material-icons remove">&#xE316;</i>
                    </span>
                  </span>
                {/if}
                {$node.label}
              </a>
              {if $node.children|count}
              <div {if $depth === 0} class="popover sub-menu js-sub-menu collapse new_submenu_designe9"{else} class="collapse_{$depth}"{/if} id="top_sub_menu_{$_expand_id}">
                {menu nodes=$node.children depth=$node.depth parent=$node}
              </div>
              {/if}
            </li>
        {/foreach}
      </ul>
    {/if}
{/function}

<div class="menu js-top-menu position-static hidden-sm-down" id="_desktop_top_menu">
    {menu nodes=$menu.children}
    <div class="clearfix"></div>
</div>



<div id="gray_background"></div>
<div id="mobile_menu_custom">
      {assign var=_counter_custom value=0}
      {function name="menu_custom" nodes=[] depth=0 parent=null}
        {if $nodes|count}
          <ul class="custom-menu-list container custom_sub_menu_{$depth}" {if $depth == 0}id="custom-menu-root"{/if} data-depth="{$depth}">
            {foreach from=$nodes item=node}
              <li class="custom-{$node.type}{if $node.current} current {/if}" id="custom_{$node.page_identifier}">
                {assign var=_counter_custom value=$_counter_custom+1}
                <a
                  class="{if $depth >= 0}custom-dropdown-item{/if}{if $depth === 1} custom-dropdown-submenu{/if}"
                  href="{$node.url}" data-depth="{$depth}"
                  {if $node.open_in_new_window} target="_blank" {/if}
                >
                  {if $node.children|count}
                    {assign var=_expand_id_custom value=200|mt_rand:999999}
                    <span class="float-xs-right hidden-md-up">
                      <span data-target="#custom_sub_menu_{$_expand_id_custom}" data-toggle="collapse" class="navbar-toggler collapse-icons">
                        <i class="material-icons add">&#xE313;</i>
                        <i class="material-icons remove">&#xE316;</i>
                      </span>
                    </span>
                  {/if}
                  {$node.label}
                </a>
                {if $node.children|count}
                  <div {if $depth === 0} class="popover custom-sub-menu js-custom-sub-menu collapse new_submenu_custom_mobile"{else} class="collapse_custom_{$depth}"{/if} id="custom_sub_menu_{$_expand_id_custom}">
                    {menu_custom nodes=$node.children depth=$node.depth parent=$node}
                  </div>
                {/if}
              </li>
            {/foreach}
          </ul>
        {/if}
      {/function}

      <div class="menu custom-js-top-menu position-static" id="custom_menu_wrapper">
        <li class="close_menu_mobile">
          <div class="pull-left">
          ☰ Menu
          </div>
          
          <div class="pull-right"> 
            <span class="mm_menus_back_icon" style="position: relative;top: -2px;">&#9001;</span> 
            Retour
          </div>
        </li>
        {menu_custom nodes=$menu.children}
        <div class="clearfix"></div>
      </div>
</div>