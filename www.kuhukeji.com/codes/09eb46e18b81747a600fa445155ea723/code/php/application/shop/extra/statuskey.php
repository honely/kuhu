<?php
//命名请 与 statusvalue 命名保持一致
//使用函数 getMenan();
return [
    'shop_stock_change_type' => [
        'ddck' => 1,
        'pdjs' => 2,
        'splr' => 11,
        'thrk' => 12,
        'pdzj' => 13,
    ],

    //商品属性 录入方式
    'shop_attr_input_type' => [
        'sglr' => 0,
        'lbxz' => 1,
        'dhwb' => 2,
    ],
    //商品活动类型
    'shop_prom_type' => [
        'no' => 0,
        'kj' => 1,
        'pt' => 2,
        'qg' => 3,
        'dz' => 4,
        'mj' => 5,
    ],

    'shop_stock_status' => [
        'wh' => 1,
        'jjsq' => 2,
        'kcjz' => 3,
        'xygz' => 4,
        'kccz' => 5,
    ],
    'coupon_type' => [
        'xdzs' => 0,
        'zdff' => 1,
        'mflq' => 2,
    ],
    'coupon_use_type' => [
        'ptq' => 0,
        'hyzx' => 1,
        'xrzx' => 2,
    ],
    'coupon_usearea' => [
        'qcty' => 0,
        'zdfl' => 1,
    ],
    'agent_apply_audit_setting' => [
        'sqtg' => 1,
        'sqsh' => 2,
    ],
    'agent_junior_setting' => [
        'djlj' => 1,
        'scxd' => 2,
        'scfk' => 3,
    ],

    //app类型
    'app_type' => [
        'wnjz' => 1,
        'tysc' => 2,
    ],
    //顾问类型
    'agent_group' => [
        'wkt' => 0,
        'ptgw' => 1,
        'zsgw' => 2,
        'zjgw' => 3,
    ],
    //短信类型
    'sms_tmp_type' => [
        'zcdx' => 0,
        'yxdx' => 1,
        'jrdx' => 2,
    ],
    //积分订单状态
    'integral_order_status' => [
        'dzf' => 0,
        'dfh' => 1,
        'dsh' => 2,
        'ywc' => 3,
        'qxsqz' => 4,
        'yqx' => 5,
        'yfqtk' => 6,
        'ytk' => 7,
    ],
    //积分消费/活动类型
    'integral_log_type' => [
        'xdzs' => 1,
        'hpzs' => 2,
        'qdjl' => 3,
        'tgjl' => 4,
        'htzs' => 5,
        'xtth' => 6,
        'dhsp' => 11,
        'htkc'  => 12,
    ],
    /**
     *   1 => '微信支付',
    2 => '支付宝支付',
    3 => '百度支付（聚合）',
    4 => '余额支付',
    5 => '微信支付H5',
    6 => '支付宝支付H5'
     */
    'order_payment_method' => [
        'wxzf' => 1,
        'zfbzf' => 2,
        'bdzf' => 3,
        'yezf' => 4,
        'h5wx' => 5,
        'h5zfb' => 6,
        'ttzfb' => 7,
        'htbjzf' => 8,
    ],
    //顾问分佣表type类型
    'agent_money_type' => [
        'kthy' => 1,
        'ddtc' => 2,
        'xjkthy' => 3,
        'xjddtc' => 4,
        'tx' => 11,

    ],
    //积分商城订单取消订单理由
    'integral_order_cancel_reason' => [
        'fkwfh' => 1,
        'mcl' => 2,
        'bxml' => 3,
    ],
    //用户余额类型
    'user_money_type' => [
        'cz' => 1,
        'tk' => 2,
        'htzs' => 3,
        'tx' => 11,
        'xf' => 12,
        'htkc' => 13,
        'kthy' => 14,
    ],
    //订单状态
    'order_status' => [
        'dqr' => 0,
        'yqr' => 1,
        'ysh' => 2,
        'yqx' => 3,
        'ywc' => 4,
        'yzf' => 5,
    ],
    //物流状态
    'order_shipping_status' => [
        'wfh' => 0,
        'yfh' => 1,
        'bffh' => 2,
        'wljs' => 3,
    ],
    'integral_order_pay_status' => [
        'wzf' => 0,
        'yzf' => 1,
        'sqtk' => 2,
        'ytk' => 3,
        'jjtk' => 4,
    ],
    //订单支付状态
    'order_pay_status' => [
        'wzf' => 0,
        'yzf' => 1,
        'sqtk' => 2,
        'ytk' => 3,
        'jjtk' => 4,
    ],
    //货物状态
    'user_goods_status' => [
        'wsh' => 0,
        'ysh' => 1,
    ],
    //未收货退货原因
    'no_goods_reject_reason' => [
        'byl' => 1,
        'kbg' => 2,
        'kdwsd' => 3,
        'kdwjl' => 4,
        'kdps' => 5,
    ],
    //已收货退货原因
    'has_goods_reject_reason' => [
        'bxy' => 11,
        'spbf' => 12,
        'spsh' => 13,
        'lfsj' => 14,
        'zlwt' => 15,
    ],

    //退款状态
    'order_reject_status' => [
        'sqtk' => 0,
        'tytk' => 1,
        'jjtk' => 2,
    ],
    //订单发货类型
    'shipping_send_type' => [
        'ztkd' => 0,
        'zxyy' => 1,
        'dzmd' => 2,
        'wxwl' => 3,
    ],

    //用户性别
    'user_sex' => [
        'bm' => 0,
        'nan' => 1,
        'nv' => 2,
    ],

    'shop_withdraw_type' => [
        'zchy' => 1,
        'tgy' => 2,
    ],

    'shop_withdraw_status' => [
        'sqz' => 0,
        'tybdk' => 1,
        'jj' => 2,
    ],




];
