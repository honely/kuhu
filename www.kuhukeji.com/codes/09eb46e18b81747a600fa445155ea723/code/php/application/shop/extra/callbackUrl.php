<?php
return [

    //商城 抢购 回调地址
    'shop_payment_notify_callback' => '/shop/api.callback/orderCallback',
    'shop_payment_return_callback' => '/shop/api.returncallback/orderCallbackReturn',

    //拼团回调地址
    'pintuan_payment_notify_callback' => '/shop/api.callback/pintuanCallback',
    'pintuan_payment_return_callback' => '/shop/api.returncallback/pintuanCallbackReturn',

    //砍价回调地址
    'kanjia_payment_notify_callback' => '/shop/api.callback/kanjiaCallback',
    'kanjia_payment_return_callback' => '/shop/api.returncallback/kanjiaCallbackReturn',

    //vip订单回调地址
    'vip_payment_notify_callback' => '/shop/api.callback/vipCallback',
    'vip_payment_return_callback' => '/shop/api.returncallback/vipCallbackReturn',

    //积分商城订单回调地址
    'integral_payment_notify_callback' => '/shop/api.callback/integralCallback',
    'integral_payment_return_callback' => '/shop/api.returncallback/integralCallbackReturn',

    //充值回调地址
    'money_payment_notify_callback' => '/shop/api.callback/moneyCallback',
    'money_payment_return_callback' => '/shop/api.returncallback/moneyCallbackReturn',
];