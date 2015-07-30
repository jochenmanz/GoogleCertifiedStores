<!-- START Google Zertifizierte Händler Order -->
{if $sBasket.content && $sOrderNumber}
    <div id="gts-order" style="display: none;" translate="no">
        {if $sAmountWithTax}
            {assign var="sAmountTax" value=$sAmountWithTax|replace:",":"."}
        {else}
            {assign var="sAmountTax" value=$sAmount|replace:",":"."}
        {/if}

        {if $sAmountNet}
            {assign var="sAmountNumeric" value=$sAmountNet|replace:",":"."}
        {else}
            {assign var="sAmountNumeric" value=$sAmount|replace:",":"."}
        {/if}

        {assign var="sAmountTax" value=$sAmountTax-$sAmountNumeric}

        {assign var="ARV_GTS_CURRENCY" value='EUR'}
        {foreach from=$sBasket.content item=sBasketItem}
            {if !$sBasketItem.modus}
                {assign var="ARV_GTS_CURRENCY" value=$sBasketItem.sCurrencyName}
            {/if}
        {/foreach}

        <!-- start order and merchant information -->
        <span id="gts-o-id">{$sOrderNumber|round}</span>
        <span id="gts-o-domain">{$ARV_GTS_MERCHANT_ORDER_DOMAIN|escape}</span>
        <span id="gts-o-email">{$sUserData.additional.user.email|escape}</span>
        <span id="gts-o-country">{$ARV_GTS_COUNTRY|escape}</span>
        <span id="gts-o-currency">{$ARV_GTS_CURRENCY|escape}</span>
        <span id="gts-o-total">{$sAmountNumeric|round:2}</span>
        <span id="gts-o-discounts">0.0</span>
        <span id="gts-o-shipping-total">{$sShippingcosts|replace:',':'.'|round:2}</span>
        <span id="gts-o-tax-total">{$sAmountTax|round:2}</span>
        <span id="gts-o-est-ship-date">{$ARV_GTS_ORDER_EST_SHIP_DATE}</span>
        <span id="gts-o-est-delivery-date">{$ARV_GTS_ORDER_EST_DELIVERY_DATE}</span>
        <span id="gts-o-has-preorder">N</span>
        <span id="gts-o-has-digital">{if $sShowEsdNote}Y{else}N{/if}</span>
        <!-- end order and merchant information -->

        <!-- start repeated item specific information -->
        {foreach from=$sBasket.content item=sBasketItem}
            {if !$sBasketItem.modus}
                <span class="gts-item">
                    <span class="gts-i-name">{$sBasketItem.articlename|escape}</span>
                    <span class="gts-i-price">{$sBasketItem.priceNumeric|round:2}</span>
                    <span class="gts-i-quantity">{$sBasketItem.quantity|round}</span>
                </span>
            {/if}
        {/foreach}
        <!-- end repeated item specific information -->
    </div>
{/if}
<!-- END Google Zertifizierte Händler Order -->