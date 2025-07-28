<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link rel="shortcut icon" href="/images/unionpos2.ico">
    <title>유니온소프트 ASP</title>
    <link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.9.2.custom.css">
    <script type="text/javascript" src="/js/xe/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.9.1.custom.js"></script>
    <script type="text/javascript" src="/js/jquery.number.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/ui.jqgrid.css">
    <script type="text/javascript" src="/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript" src="/js/jquery.jqGrid.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="/css/daterangepicker-master/daterangepicker.css">
    <script type="text/javascript" src="/js/moment.js"></script>
    <script type="text/javascript" src="/js/jquery.daterangepicker.js"></script>
    <script type="text/javascript" src="/js/daterangepicker.js"></script>
    <script type="text/javascript" src="/js/jquery.mtz.monthpicker.js"></script>
    <script type="text/javascript" src="/js/plus/style.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/plus/include.css?v=202305251027">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/xeicon/2.2.0/xeicon.min.css">
    <!--[if lt IE 9]>
	<script type="text/javascript" src="/js/plus/html5shiv.js"></script>
	<script type="text/javascript" src="/js/plus/html5shiv.printshiv.js"></script>
<![endif]-->
    <link rel="stylesheet" type="text/css" href="/css/toastr.css">
    <script type="text/javascript" src="/js/toastr.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/plus/myStyle.css?v=20240827_103300">
    <link rel="stylesheet" type="text/css" href="/css/plus/redbutton.css">
    <script type="text/javascript" src="/js/common.js?v=20250409_182200"></script>
    <script>
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
    </script>
    <script>
        $(document).ready(function() {
            $(".menu-board-notice3>a").addClass("active");
            $(".menu-board>a").addClass("active");
            $("#btnAdd").click(function() {
                fn_Add();
            });
        });
        function fn_Detail(NoticeID) {
            location.href = "/v2/board/notice3/view?NoticeID=" + NoticeID;
        }
        function fn_Add() {
            location.href = "/v2/board/notice3/add";
        }
        function goPage(pageNo) {
            $("#pageNo").val(pageNo);
            search();
        }
        function search() {
            $('#searchForm').attr("action", "/v2/board/notice3/list");
            $("#searchForm").submit();
        }
    </script>
</head>
<body>
    <!-- 헤더영역 -->
    <style>
        .wrap-loading {
            /*화면 전체를 어둡게 합니다.*/
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.2);
            /*not in ie */
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
            /* ie */
            z-index: 9999;
        }
        .wrap-loading div {
            /*로딩 이미지*/
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -40px;
            margin-top: -80px;
        }
        .login_info_btn_area button i {
            font-size: 16px;
            vertical-align: middle;
            line-height: 16px;
        }
        .login_info_btn_area button span {
            vertical-align: middle;
            line-height: 16px;
        }
    </style>
    <script type="text/javascript">
        function loadingShow() {
            $('.wrap-loading').show();
        }
        function loadingHide() {
            $('.wrap-loading').hide();
        }
    </script>
    <style>
        .top-storeName {
            float: left;
            height: 36px;
            overflow: hidden;
            margin: 13px 50px 0 0;
            font-size: 20px;
            font-weight: bold;
            color: #d7d7d7;
            padding-left: 56px;
        }
    </style>
    <div class="wrap-loading" style="display: none;">
        <div><img src="/images/hourglass.svg"></div>
    </div>
    <header id="header">
        <div class="head">
            <h1 class="logo">
                <a href="/v2/main"><img src="/images/common/logo.png" alt="유니온소프트"></a>
            </h1>
            <div class="top_title">
                유니온소프트 ASP
            </div>
            <div class="top-storeName">
                테스트(25.07.17)
            </div>
            <div class="login_info_area">
                <p class="login_member">
                    테스트(25.07.17)
                    님 환영합니다.
                </p>
                <div class="login_info_btn_area">
                    <button type="button" class="" onclick="window.location.href='/v2/logout';">
                        <i class="xi-log-out"></i>
                        <span class="btn1">로그아웃</span>
                    </button>
                    <button type="button" class="" onclick="javascript:fn_PopupPasswordChangeOpen();">
                        <i class="xi-user"></i>
                        <span class="btn1">패스워드 변경</span>
                    </button>
                </div>
            </div>
        </div>
        <script>
            var boolDebug = false;
            function movePage(page, dataSend) {
                setTimeout(
                    function() {
                        loadingShow();
                    }, 300);
                switch (page) {
                    case "main":
                        location.href = "/v2/main";
                        break;
                    case "menu-board-notice":
                        location.href = "/v2/board/notice/list";
                        break;
                    case "menu-board-notice3":
                        location.href = "/v2/board/notice3/list";
                        break;
                    case "allStore-search-distribution":
                        location.href = "/v2/allStore/distribution";
                        break;
                    case "sales-period-day":
                        if (!isEmpty(dataSend))
                            location.href = "/v2/sales/period/day?" + dataSend;
                        else
                            location.href = "/v2/sales/period/day";
                        break;
                    case "sales-period-month":
                        location.href = "/v2/sales/period/month";
                        break;
                    case "sales-period-week":
                        location.href = "/v2/sales/period/week";
                        break;
                    case "sales-period-hour":
                        location.href = "/v2/sales/period/hour";
                        break;
                    case "sales-period-calendar":
                        location.href = "/v2/sales/period/calendar";
                        break;
                    case "sales-period-compare":
                        location.href = "/v2/sales/period/compare";
                        break;
                    case "sales-product-item":
                        location.href = "/v2/sales/product/item";
                        break;
                    case "sales-product-item2":
                        location.href = "/v2/sales/product/item2";
                        break;
                    case "sales-product-itemSet":
                        location.href = "/v2/sales/product/itemSet";
                        break;
                    case "sales-product-group":
                        location.href = "/v2/sales/product/group";
                        break;
                    case "sales-product-group2":
                        location.href = "/v2/sales/product/group2";
                        break;
                    case "sales-product-hour":
                        location.href = "/v2/sales/product/hour";
                        break;
                    case "sales-product-groupCut":
                        location.href = "/v2/sales/product/groupCut";
                        break;
                    case "sales-product-time":
                        location.href = "/v2/sales/product/time";
                        break;
                    case "sales-product-storeItem":
                        location.href = "/v2/sales/product/storeItem";
                        break;
                    case "sales-product-storeDayItem":
                        location.href = "/v2/sales/product/storeDayItem";
                        break;
                    case "sales-product-itemDay":
                        location.href = "/v2/sales/product/itemDay";
                        break;
                    case "sales-product-itemHour":
                        location.href = "/v2/sales/product/itemHour";
                        break;
                    case "sales-detail-receipt":
                        if (!isEmpty(dataSend))
                            location.href = "/v2/sales/detail/receipt?" + dataSend;
                        else
                            location.href = "/v2/sales/detail/receipt";
                        break;
                    case "sales-detail-receipt2":
                        if (!isEmpty(dataSend))
                            location.href = "/v2/sales/detail/receipt2?" + dataSend;
                        else
                            location.href = "/v2/sales/detail/receipt2";
                        break;
                    case "sales-detail-card":
                        location.href = "/v2/sales/detail/card";
                        break;
                    case "sales-detail-cardApproval":
                        location.href = "/v2/sales/detail/cardApproval";
                        break;
                    case "sales-detail-cashReceipt":
                        location.href = "/v2/sales/detail/cashReceipt";
                        break;
                    case "sales-detail-detail":
                        location.href = "/v2/sales/detail/detail";
                        break;
                    case "sales-detail-adjust":
                        location.href = "/v2/sales/detail/adjust";
                        break;
                    case "sales-cardsales-approval":
                        location.href = "/v2/sales/cardsales/approval";
                        break;
                    case "sales-cardsales-noApproval":
                        location.href = "/v2/sales/cardsales/noApproval";
                        break;
                    case "sales-cardsales-purchase":
                        location.href = "/v2/sales/cardsales/purchase";
                        break;
                    case "sales-cardsales-payment":
                        location.href = "/v2/sales/cardsales/payment";
                        break;
                    case "sales-cardsales-salebook":
                        location.href = "/v2/sales/cardsales/salebook";
                        break;
                    case "sales-cardsales-etcservice":
                        location.href = "/v2/sales/cardsales/etcservice";
                        break;
                    case "sales-etc-seatmove":
                        location.href = "/v2/sales/etc/seatmove";
                        break;
                    case "sales-etc-sethistory":
                        location.href = "/v2/sales/etc/sethistory";
                        break;
                    case "sales-etc-reservation":
                        if (!isEmpty(dataSend))
                            location.href = "/v2/sales/etc/reservation?" + dataSend;
                        else
                            location.href = "/v2/sales/etc/reservation";
                        break;
                    case "sales-etc-tax":
                        location.href = "/v2/sales/etc/tax";
                        break;
                    case "sales-etc-taxMonth":
                        location.href = "/v2/sales/etc/taxMonth";
                        break;
                    case "sales-etc-table":
                        location.href = "/v2/sales/etc/table";
                        break;
                    case "sales-etc-tableStatus":
                        location.href = "/v2/sales/etc/tableStatus";
                        break;
                    case "sales-etc-pos":
                        location.href = "/v2/sales/etc/pos";
                        break;
                    case "sales-etc-inout":
                        location.href = "/v2/sales/etc/inout";
                        break;
                    case "sales-etc-dilegence":
                        location.href = "/v2/sales/etc/dilegence";
                        break;
                    case "sales-etc-posLogin":
                        location.href = "/v2/sales/etc/pos/login";
                        break;
                    case "sales-etc-edenredMgr":
                        location.href = "/v2/sales/etc/edenredMgr";
                        break;
                    case "sales-etc-royalty":
                        location.href = "/v2/sales/etc/royalty";
                        break;
                    case "sales-etc-dcDetail":
                        location.href = "/v2/sales/etc/dcDetail";
                        break;
                    case "sales-etc-dcTotalEvent":
                        location.href = "/v2/sales/etc/dcTotalEvent";
                        break;
                    case "sales-etc-dcEvent":
                        location.href = "/v2/sales/etc/dcEvent";
                        break;
                    case "sales-etc-storeName":
                        location.href = "/v2/sales/etc/storeName";
                        break;
                    case "sales-etc-storeCard":
                        location.href = "/v2/sales/etc/storeCard";
                        break;
                    case "sales-etc-storeVanPg":
                        location.href = "/v2/sales/etc/storeVanPg";
                        break;
                    case "sales-etc-cosmoCollect":
                        location.href = "/v2/sales/etc/cosmoCollect";
                        break;
                    case "sales-etc-cosmoSales":
                        location.href = "/v2/sales/etc/cosmoSales";
                        break;
                    case "sales-etc-receiptLog":
                        location.href = "/v2/sales/etc/receiptLog";
                        break;
                    case "sales-delivery-day":
                        location.href = "/v2/sales/delivery/day";
                        break;
                    case "sales-delivery-receipt":
                        location.href = "/v2/sales/delivery/receipt";
                        break;
                    case "sales-pack-day":
                        location.href = "/v2/sales/pack/day";
                        break;
                    case "sales-pack-month":
                        location.href = "/v2/sales/pack/month";
                        break;
                    case "sales-category-day":
                        location.href = "/v2/sales/category/day";
                        break;
                    case "sales-category-month":
                        location.href = "/v2/sales/category/month";
                        break;
                    case "sales-member-member":
                        if (!isEmpty(dataSend))
                            location.href = "/v2/sales/member/member?" + dataSend;
                        else
                            location.href = "/v2/sales/member/member";
                        break;
                    case "sales-member-keep":
                        location.href = "/v2/sales/member/keep";
                        break;
                    case "sales-member-keepReceipt":
                        location.href = "/v2/sales/member/keepReceipt";
                        break;
                    case "sales-member-tick":
                        location.href = "/v2/sales/member/tick";
                        break;
                    case "sales-member-tickReceipt":
                        location.href = "/v2/sales/member/tickReceipt";
                        break;
                    case "sales-member-point":
                        location.href = "/v2/sales/member/point";
                        break;
                    case "sales-member-custSellCombine":
                        location.href = "/v2/sales/member/custSellCombine";
                        break;
                    case "sales-member-custSell":
                        location.href = "/v2/sales/member/custSell";
                        break;
                    case "sales-member-custProduct":
                        location.href = "/v2/sales/member/custProduct";
                        break;
                    case "sales-member-custReceipt":
                        location.href = "/v2/sales/member/custReceipt";
                        break;
                    case "sales-member-memberCount":
                        location.href = "/v2/sales/member/memberCount";
                        break;
                    case "central-order-request":
                        location.href = "/v2/central/order/request";
                        break
                    case "central-item-group":
                        location.href = "/v2/central/item/group";
                        break;
                    case "central-item-storeGroupYn":
                        location.href = "/v2/central/item/storeGroupYn";
                        break;
                    case "central-item-item":
                        location.href = "/v2/central/item";
                        break;
                    case "central-item-itemImage":
                        location.href = "/v2/central/itemImage";
                        break;
                    case "central-item-storeItemAmt":
                        location.href = "/v2/central/item/storeItemAmt";
                        break;
                    case "central-item-itemLang":
                        location.href = "/v2/central/item/itemLang";
                        break;
                    case "central-item-optionMenu":
                        //location.href = "/v2/central/item/optionMenu";
                        if (boolDebug == true) {
                            location.href = "/v2/central/item/optionMenu";
                        } else {
                            toastr.options = {
                                "timeOut": 3000
                            }
                            toastr.warning("현재 구현 및 테스트중입니다.");
                            setTimeout(
                                function() {
                                    loadingHide();
                                }, 400);
                        }
                        break;
                    case "central-item-changeLog":
                        location.href = "/v2/central/item/changeLog";
                        break;
                    case "central-item-itemOrderBy":
                        location.href = "/v2/central/item/itemOrderBy";
                        break;
                    case "central-order-check":
                        location.href = "/v2/central/order/check";
                        break
                    case "central-order-warehousing":
                        location.href = "/v2/central/order/warehousing";
                        break;
                    case "central-store-storeAdmin":
                        location.href = "/v2/central/store/storeAdmin";
                        break;
                    case "central-store-storeLine":
                        location.href = "/v2/central/store/storeLine";
                        break;
                    case "central-store-storeNewLine":
                        location.href = "/v2/central/store/storeNewLine";
                        break;
                    case "central-store-branch":
                        location.href = "/v2/central/store/branch";
                        break;
                    case "central-cust-cust":
                        location.href = "/v2/central/cust";
                        break;
                    case "central-cust-point":
                        location.href = "/v2/central/cust/point";
                        break;
                    case "central-cust-sales":
                        location.href = "/v2/central/cust/sales";
                        break;
                    case "central-cust-type":
                        location.href = "/v2/central/cust/type";
                        break;
                    case "central-store-posImage":
                        location.href = "/v2/central/store/posImage";
                        break;
                    case "central-table-orderUse":
                        location.href = "/v2/central/table/order/orderUse";
                        break;
                    case "central-table-orderUseGroup":
                        location.href = "/v2/central/table/order/orderUseGroup";
                        break;
                    case "central-table-orderUseItem":
                        location.href = "/v2/central/table/order/orderUseItem";
                        break;
                    case "store-base-base":
                        location.href = "/v2/store/base/base";
                        break;
                    case "store-base-equip":
                        location.href = "/v2/store/base/equip";
                        break;
                        //case "store-base-equip2":
                        //	location.href = "/v2/store/base/equip2";
                        //	break;
                    case "store-base-output":
                        location.href = "/v2/store/base/output";
                        break;
                    case "store-base-storeInfo":
                        location.href = "/v2/store/base/storeInfo";
                        break;
                    case "store-item-item":
                        location.href = "/v2/store/item/item";
                        break;
                    case "store-item-itemImage":
                        location.href = "/v2/store/item/itemImage";
                        break;
                    case "store-item-itemLang":
                        location.href = "/v2/store/item/itemLang";
                        break;
                    case "store-item-itemMid":
                        location.href = "/v2/store/item/itemMid";
                        break;
                    case "store-item2-disGroup":
                        location.href = "/v2/store/item/disGroup";
                        break;
                    case "store-item2-disItem":
                        location.href = "/v2/store/item/disItem";
                        break;
                    case "store-item-favorite":
                        location.href = "/v2/store/item/favorite";
                        break;
                    case "store-item2-disFavorite":
                        location.href = "/v2/store/item/disFavorite";
                        break;
                    case "store-employee-employee":
                        location.href = "/v2/store/employee/employee";
                        break;
                    case "store-copy-copy":
                        location.href = "/v2/store/copy/copy";
                        break;
                    case "store-table-floating":
                        location.href = "/v2/store/table/floating";
                        break;
                    case "store-pos-companyInfo":
                        location.href = "/v2/store/pos/companyInfo";
                        break;
                    case "store-pos-cardSetView":
                        location.href = "/v2/store/pos/cardSetView";
                        break;
                    case "store-pos-etc":
                        location.href = "/v2/store/pos/etc";
                        break;
                    case "store-pos-pay":
                        location.href = "/v2/store/pos/pay";
                        break;
                    case "store-pos-payPos":
                        location.href = "/v2/store/pos/payPos";
                        break;
                    case "store-pos-kiosk":
                        location.href = "/v2/store/pos/kiosk";
                        break;
                    case "store-pos-posImage":
                        location.href = "/v2/store/pos/posImage";
                        break;
                    case "store-delivery-addr":
                        location.href = "/v2/store/delivery/addr";
                        break;
                    case "store-etc-button":
                        location.href = "/v2/store/etc/button";
                        break;
                    case "store-etc-log":
                        location.href = "/v2/store/etc/log";
                        break;
                    case "store-etc-changeLog":
                        location.href = "/v2/store/etc/changeLog";
                        break;
                    case "store-etc-smartQr":
                        location.href = "/v2/store/etc/smart/qr";
                        break;
                    case "store-etc-smartConfig":
                        location.href = "/v2/store/etc/smart/config";
                        break;
                    case "store-etc-smartQRUid":
                        location.href = "/v2/store/etc/smart/qr/uid";
                        break;
                    case "store-etc-smartConfigHiel":
                        location.href = "/v2/store/etc/smart/config/hiel";
                        break;
                    case "store-etc-smartQRUidHiel":
                        location.href = "/v2/store/etc/smart/qr/uid/hiel";
                        break;
                    case "store-item-discountEvent":
                        location.href = "/v2/store/item/discountEvent";
                        break;
                    case "store-item3-discountTotalAmt":
                        location.href = "/v2/store/item/discountTotalAmt";
                        break;
                    case "store-item2-disDiscountEvent":
                        location.href = "/v2/store/item/dis/discountEvent";
                        break;
                    case "store-item-groupProduct":
                        location.href = "/v2/store/item/groupProduct";
                        break;
                    case "store-item-groupPos":
                        location.href = "/v2/store/item/groupPos";
                        break;
                    case "store-item-kioskPack":
                        location.href = "/v2/store/item/kioskPack";
                        break;
                    case "store-order-table":
                        location.href = "/v2/store/order/table";
                        break;
                    case "store-order-orderUse":
                        location.href = "/v2/store/order/orderUse";
                        break;
                    case "store-order-groupTime":
                        location.href = "/v2/store/order/table/groupTime";
                        break;
                    case "store-order-itemTime":
                        location.href = "/v2/store/order/table/itemTime";
                        break;
                    case "store-order-floating":
                        location.href = "/v2/store/order/table/floating";
                        break;
                    case "store-order-required":
                        location.href = "/v2/store/order/table/required";
                        break;
                    case "store-business-list":
                        location.href = "/v2/store/business/member/list";
                        break;
                    case "store-business-store":
                        location.href = "/v2/store/business/member/store";
                        break;
                    case "order-check-request":
                        location.href = "/v2/order/check/request";
                        break;
                    case "order-check-check":
                        location.href = "/v2/order/check/check";
                        break;
                    case "order-check-check2":
                        location.href = "/v2/order/check/v2/check";
                        break;
                    case "order-check-item":
                        location.href = "/v2/order/check/item";
                        break;
                    case "order-check-companyInfo":
                        location.href = "/v2/order/check/companyInfo";
                        break;
                    case "order-collect-collect":
                        location.href = "/v2/order/collect/collect";
                        break;
                    case "order-item-group":
                        location.href = "/v2/order/item/group";
                        break;
                    case "order-item-item":
                        location.href = "/v2/order/item/item";
                        break;
                    case "srf-check-useCheck":
                        location.href = "/v2/srf/check/useCheck";
                        break;
                    case "srf-check-depositCheck":
                        location.href = "/v2/srf/check/depositCheck";
                        break;
                    case "srf-search-store":
                        location.href = "/v2/srf/search/store";
                        break;
                    case "sales-etc-hStyle-sendLog":
                        location.href = "/v2/sales/etc/hStyle/sendLog";
                        break;
                    case "sales-etc-custStatus":
                        location.href = "/v2/sales/etc/custStatus";
                        break;
                    case "store-purchase-slip":
                        location.href = "/v2/store/purchase/slip";
                        break;
                    case "store-purchase-supply":
                        location.href = "/v2/store/purchase/supply";
                        break;
                    case "store-purchase-stock":
                        location.href = "/v2/store/purchase/stock";
                        break;
                    case "store-purchase-day":
                        location.href = "/v2/store/purchase/day";
                        break;
                    case "store-purchase-item":
                        location.href = "/v2/store/purchase/item";
                        break;
                    case "store-purchase-payment":
                        location.href = "/v2/store/purchase/payment";
                        break;
                        //case "srf-search-period":
                        //	location.href = "/v2/srf/search/period";
                        //	break;
                    case "chain-login":
                        location.href = "/v2/chain/login";
                        break;
                    case "chain-store-branch":
                        location.href = "/v2/chain/store/branch";
                        break;
                    case "chain-branch-login":
                        location.href = "/v2/chain/branch/login";
                        break;
                    case "virtual-login":
                        location.href = "/v2/virtual/login";
                        break;
                    case "virtual-memberAuth":
                        location.href = "/v2/partner/member/auth";
                        break;
                    case "virtual-memberLog":
                        location.href = "/v2/partner/member/login/log";
                        break;
                    case "virtual-posAdvertImage":
                        location.href = "/v2/partner/pos/posAdvertImage";
                        break;
                    case "partner-board-unpaid":
                        location.href = "/v2/partner/board/unpaid/list";
                        break;
                    case "partner-alim-adjust":
                        location.href = "/v2/partner/alim/adjust";
                        break;
                    case "partner-smart-uid":
                        location.href = "/v2/partner/smart/order/uid";
                        break;
                    case "partner-smart-store":
                        location.href = "/v2/partner/smart/order/store";
                        break;
                    case "partner-sales-storeMonth":
                        location.href = "/v2/partner/sales/storeMonth";
                        break;
                    case "admin-adminLogin":
                        location.href = "/v2/admin/adminLogin";
                        break;
                    case "admin-unipodImage":
                        location.href = "/v2/admin/unipod/image";
                        break;
                    case "admin-unipodImageUpload":
                        location.href = "/v2/admin/unipod/imageUpload";
                        break;
                    case "admin-apiTest":
                        location.href = "/v2/admin/api/test";
                        break;
                    case "admin-apiAuth":
                        location.href = "/v2/admin/api/auth";
                        break;
                    case "admin-storeTransfer":
                        location.href = "/v2/admin/storeTransfer";
                        break;
                    case "admin-memberAuth":
                        location.href = "/v2/admin/member/auth";
                        break;
                    case "admin-board-unpaid":
                        location.href = "/v2/admin/board/unpaid/list";
                        break;
                    case "admin-statis-copy":
                        location.href = "/v2/admin/statis/copy";
                        break;
                    case "admin-statis-store":
                        location.href = "/v2/admin/statis/store";
                        break;
                    case "admin-statis-unionOrderTablet":
                        location.href = "/v2/admin/statis/union/order/tablet";
                        break;
                    case "admin-statis-unionOrderStore":
                        location.href = "/v2/admin/statis/union/order/store";
                        break;
                    case "admin-statis-unionWaitingTablet":
                        location.href = "/v2/admin/statis/union/waiting/tablet";
                        break;
                    case "admin-alim-chargeCheck":
                        location.href = "/v2/admin/alim/charge/check";
                        break;
                    case "admin-alim-cost":
                        location.href = "/v2/admin/alim/cost";
                        break;
                    case "admin-alim-depositLog":
                        location.href = "/v2/admin/alim/depositLog";
                        break;
                    case "admin-alim-bizppurioLog":
                        location.href = "/v2/admin/alim/bizppurioLog";
                        break;
                    case "admin-alim-partnerAdjust":
                        location.href = "/v2/admin/alim/partnerAdjust";
                        break;
                    case "admin-alim-profile":
                        location.href = "/v2/admin/alim/profile";
                        break;
                    case "admin-alim-groupCost":
                        location.href = "/v2/admin/alim/groupCost";
                        break;
                    case "admin-alim-groupProfile":
                        location.href = "/v2/admin/alim/groupProfile";
                        break;
                    case "admin-redis":
                        location.href = "/v2/admin/redis";
                        break;
                    case "admin-posAdvertImage":
                        location.href = "/v2/admin/pos/posAdvertImage";
                        break;
                    case "admin-smart-orderAuth":
                        location.href = "/v2/admin/smart/order/auth";
                        break;
                    case "admin-smart-uid":
                        location.href = "/v2/admin/smart/order/uid";
                        break;
                    case "admin-smart-qrUid":
                        location.href = "/v2/admin/smart/qr/order/uid";
                        break;
                    case "admin-smart-store":
                        location.href = "/v2/admin/smart/order/store";
                        break;
                    case "service-holdem-config":
                        location.href = "/v2/service/holdem/config";
                        break;
                    case "service-holdem-notice":
                        location.href = "/v2/service/holdem/notice/list";
                        break;
                    case "service-holdem-blind":
                        location.href = "/v2/service/holdem/blind";
                        break;
                    case "service-holdem-advert":
                        location.href = "/v2/service/holdem/advert";
                        break;
                    case "service-holdem-cust":
                        location.href = "/v2/service/holdem/cust";
                        break;
                    case "service-holdem-table":
                        location.href = "/v2/service/holdem/table";
                        break;
                    case "service-holdem-game":
                        location.href = "/v2/service/holdem/game";
                        break;
                    case "service-holdem-dailyGame":
                        location.href = "/v2/service/holdem/dailyGame";
                        break;
                    case "sales-redbutton-storesCustStatus":
                        location.href = "/v2/sales/etc/redbutton/storesCustStatus";
                        break;
                    case "sales-redbutton-daysCustStatus":
                        location.href = "/v2/sales/etc/redbutton/daysCustStatus";
                        break;
                    case "sales-redbutton-storesItemSales":
                        location.href = "/v2/sales/etc/redbutton/storesItemSales";
                        break;
                    case "sales-redbutton-daysItemSales":
                        location.href = "/v2/sales/etc/redbutton/daysItemSales";
                        break;
                    case "sales-redbutton-storesTimeItemSales":
                        location.href = "/v2/sales/etc/redbutton/storesTimeItemSales";
                        break;
                    case "sales-redbutton-daysTimeItemSales":
                        location.href = "/v2/sales/etc/redbutton/daysTimeItemSales";
                        break;
                    case "sales-redbutton-timeOrderByTimeItemSales":
                        location.href = "/v2/sales/etc/redbutton/timeOrderByTimeItemSales";
                        break;
                    case "sales-redbutton-daysCustStatus2":
                        location.href = "/v2/sales/etc/redbutton/daysCustStatus2";
                        break;
                    case "sales-redbutton-daysItemSales2":
                        location.href = "/v2/sales/etc/redbutton/daysItemSales2";
                        break;
                    case "sales-redbutton-daysTimeItemSales2":
                        location.href = "/v2/sales/etc/redbutton/daysTimeItemSales2";
                        break;
                    case "sales-redbutton-storeDaySchedule":
                        location.href = "/v2/sales/etc/redbutton/storeDaySchedule";
                        break;
                    case "sales-redbutton-table":
                        location.href = "/v2/sales/etc/redbutton/table";
                        break;
                    case "sales-redbutton-storeDayScheduleNew":
                        location.href = "/v2/sales/etc/redbutton/storeDayScheduleNew";
                        break;
                    case "sales-redbutton-tableNew":
                        location.href = "/v2/sales/etc/redbutton/tableNew";
                        break;
                    case "sales-out-account":
                        location.href = "/v2/sales/out/account";
                        break;
                    case "sales-out-account2":
                        location.href = "/v2/sales/out/account2";
                        break;
                    case "sales-out-day":
                        location.href = "/v2/sales/out/day";
                        break;
                    case "sales-out-paymentDay":
                        location.href = "/v2/sales/out/payment/day";
                        break;
                    case "sales-period-storeDay":
                        if ("asp.unionpos.co.kr" == "asp.unionpos.co.kr") {
                            setTimeout(
                                function() {
                                    loadingHide();
                                }, 400);
                            alert("해당 메뉴는 https://asp2.unionpos.co.kr 에서만 조회 가능합니다.");
                        } else {
                            location.href = "/v2/sales/period/storeDay";
                        }
                        break;
                    case "sales-period-storeMonth":
                        if ("asp.unionpos.co.kr" == "asp.unionpos.co.kr") {
                            setTimeout(
                                function() {
                                    loadingHide();
                                }, 400);
                            alert("해당 메뉴는 https://asp2.unionpos.co.kr 에서만 조회 가능합니다.");
                        } else {
                            location.href = "/v2/sales/period/storeMonth";
                        }
                        break;
                    case "sales-period-storeHour":
                        if ("asp.unionpos.co.kr" == "asp.unionpos.co.kr") {
                            setTimeout(
                                function() {
                                    loadingHide();
                                }, 400);
                            alert("해당 메뉴는 https://asp2.unionpos.co.kr 에서만 조회 가능합니다.");
                        } else {
                            location.href = "/v2/sales/period/storeHour";
                        }
                        break;
                    case "hecto-cust-cust":
                        location.href = "/v2/hecto/cust";
                        break;
                    case "hecto-cust-sales":
                        location.href = "/v2/hecto/cust/sales";
                        break;
                    case "hecto-cust-salesCombine":
                        location.href = "/v2/hecto/cust/salesCombine";
                        break;
                    case "alim-talk-depositCharge":
                        location.href = "/v2/alim/talk/depositCharge";
                        break;
                    case "alim-talk-depositLog":
                        location.href = "/v2/alim/talk/depositLog";
                        break;
                    case "alim-talk-bizppurioLog":
                        location.href = "/v2/alim/talk/bizppurioLog";
                        break;
                    case "alim-talk-groupDepositCharge":
                        location.href = "/v2/alim/talk/groupDepositCharge";
                        break;
                    case "alim-talk-groupDepositLog":
                        location.href = "/v2/alim/talk/groupDepositLog";
                        break;
                    case "alim-talk-groupBizppurioLog":
                        location.href = "/v2/alim/talk/groupBizppurioLog";
                        break;
                    case "alim-talk-groupProfile":
                        location.href = "/v2/alim/talk/group/profile";
                        break;
                    case "alim-talk-storeProfile":
                        location.href = "/v2/alim/talk/store/profile";
                        break;
                    case "fast-period-day":
                        location.href = "/v2/fast/period/day";
                        break;
                    case "fast-period-month":
                        location.href = "/v2/fast/period/month";
                        break;
                    case "fast-period-calendar":
                        location.href = "/v2/fast/period/calendar";
                        break;
                    case "fast-period-storeDay":
                        location.href = "/v2/fast/period/storeDay";
                        break;
                    case "fast-period-storeMonth":
                        location.href = "/v2/fast/period/storeMonth";
                        break;
                    case "fast-product-item":
                        location.href = "/v2/fast/product/item";
                        break;
                    case "fast-product-storeItem":
                        location.href = "/v2/fast/product/storeItem";
                        break;
                    case "redbutton-member-list":
                        location.href = "/v2/redbutton/member/list";
                        break;
                    case "redbutton-member-store":
                        location.href = "/v2/redbutton/member/store";
                        break;
                    case "redbutton-sales-day":
                        location.href = "/v2/redbutton/sales/day";
                        break;
                    case "redbutton-sales-month":
                        location.href = "/v2/redbutton/sales/month";
                        break;
                    case "redbutton-sales-calendar":
                        location.href = "/v2/redbutton/sales/calendar";
                        break;
                    case "redbutton-sales-tableStatus":
                        location.href = "/v2/redbutton/sales/tableStatus";
                        break;
                    case "redbutton-member-item":
                        location.href = "/v2/central/redbutton/item";
                        break;
                    case "sales-out-stop":
                        alert("외부 사이트 정책으로 계속 차단되는 관계로 더이상 제공되지 않습니다.");
                        setTimeout(
                            function() {
                                loadingHide();
                            }, 400);
                        break;
                    case "sales-business-day":
                        location.href = "/v2/sales/store/business/day";
                        break;
                    case "sales-business-month":
                        location.href = "/v2/sales/store/business/month";
                        break;
                    case "sales-business-calendar":
                        location.href = "/v2/sales/store/business/calendar";
                        break;
                    case "sales-business-item":
                        location.href = "/v2/sales/store/business/item";
                        break;
                    default:
                        toastr.options = {
                            "timeOut": 3000
                        }
                        toastr.warning("구현중 입니다.");
                        setTimeout(
                            function() {
                                loadingHide();
                            }, 400);
                        //alert("구현중 입니다.");
                        break;
                }
            }
        </script>
        <div id="lnb" class="">
            <!-- lnb -->
            <div class="navigation">
                <h2 class="invisible">주메뉴</h2>
                <ul class="inner">
                    <li class="nav1" style="height: 40px;overflow: hidden;"><a href="javascript:movePage('fast-period-day');">빠른 매출</a>
                        <div class="sub_navigation">
                            <ul class="deps1">
                                <li class="sub-depth fast-period"><a href="javascript:movePage('fast-period-day');"><strong>기간별 매출</strong></a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav1" style="height: 40px;overflow: hidden;"><a href="javascript:movePage('sales-period-day', 'StandMenuView=true');">매출 조회</a>
                        <div class="sub_navigation">
                            <ul class="deps1">
                                <li class="sub-depth sales-period"><a href="javascript:movePage('sales-period-day');"><strong>기간별 매출</strong></a></li>
                                <li class="menu-list sales-period-day"><a href="javascript:movePage('sales-period-day');"> - 일자별 매출</a></li>
                                <li class="menu-list sales-period-month"><a href="javascript:movePage('sales-period-month');"> - 월별 매출</a></li>
                                <li class="menu-list sales-period-week"><a href="javascript:movePage('sales-period-week');"> - 요일별 매출</a></li>
                                <li class="menu-list sales-period-hour"><a href="javascript:movePage('sales-period-hour');"> - 시간별 매출</a></li>
                                <li class="menu-list sales-period-calendar"><a href="javascript:movePage('sales-period-calendar');"> - 달력 매출</a></li>
                                <li class="sub-depth sales-product"><a href="javascript:movePage('sales-product-item');"><strong>상품&amp;분류별 매출</strong></a></li>
                                <li class="menu-list sales-product-item"><a href="javascript:movePage('sales-product-item');"> - 상품별 매출</a></li>
                                <li class="menu-list sales-product-time"><a href="javascript:movePage('sales-product-time');"> - 시간순 상품 매출</a></li>
                                <li class="menu-list sales-product-groupCut"><a href="javascript:movePage('sales-product-groupCut');"> - 분류별 간편 매출</a></li>
                                <li class="menu-list sales-product-group"><a href="javascript:movePage('sales-product-group');"> - 분류별 매출</a></li>
                                <li class="sub-depth sales-detail"><a href="javascript:movePage('sales-detail-receipt');"><strong>상세 매출</strong></a></li>
                                <li class="menu-list sales-detail-receipt"><a href="javascript:movePage('sales-detail-receipt');"> - 영수증별 매출</a></li>
                                <li class="menu-list sales-detail-card"><a href="javascript:movePage('sales-detail-card');"> - 카드사별 매출</a></li>
                                <li class="menu-list sales-detail-cardApproval"><a href="javascript:movePage('sales-detail-cardApproval');"> - 카드 승인건별 매출</a></li>
                                <li class="menu-list sales-detail-salebook"><a href="javascript:movePage('sales-detail-salebook');"> - 여신 매출장부</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav2" style="height: 40px;overflow: hidden;"><a href="javascript:movePage('sales-etc-reservation', 'StandMenuView=true');" class="">기타 조회</a>
                        <div class="sub_navigation active" style="">
                            <ul class="deps1">
                                <li class="sub-depth sales-etc"><a href="javascript:movePage('sales-etc-seatmove');"><strong>기타 조회</strong></a></li>
                                <li class="menu-list sales-etc-seatmove"><a href="javascript:movePage('sales-etc-seatmove');"> - 좌석 이동</a></li>
                                <li class="menu-list sales-etc-sethistory"><a href="javascript:movePage('sales-etc-sethistory');"> - 세트 내역</a></li>
                                <li class="menu-list sales-etc-reservation"><a href="javascript:movePage('sales-etc-reservation');"> - 예약 조회</a></li>
                                <li class="menu-list sales-etc-tax"><a href="javascript:movePage('sales-etc-tax');"> - 과세/면세 조회</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav2" style="height: 40px;overflow: hidden;"><a href="javascript:movePage('sales-member-member', 'StandMenuView=true');" class="">회원 관리</a>
                        <div class="sub_navigation" style="">
                            <ul class="deps1">
                                <li class="sub-depth sales-member"><a href="javascript:movePage('sales-member-member');"><strong>회원 조회</strong></a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav4" style="height: 40px;overflow: hidden;"><a href="javascript:movePage('alim-talk-depositCharge');" class="">알림톡</a>
                        <div class="sub_navigation" style="">
                            <ul class="deps1">
                                <li class="menu-list alim-talk"><a href="javascript:movePage('alim-talk-depositCharge');"><strong>예치금 충전</strong></a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav4" style="height: 40px;overflow: hidden;"><a href="javascript:movePage('menu-board-notice3');" class="">공지사항</a>
                        <div class="sub_navigation" style="">
                            <ul class="deps1">
                                <li class="menu-list menu-board"><a href="javascript:movePage('menu-board-notice3');" class="active"><strong>공지사항</strong></a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $(".btnPasswordPopupClose").click(function() {
                    fn_PopupPasswordChangeClose();
                });
                $("#popup-password").dialog({
                    modal: true,
                    autoOpen: false,
                    width: 400,
                    height: 320,
                    resizable: false,
                    open: function(event, ui) {
                        $(this).parent().focus();
                        $("body").addClass('stop-scrolling');
                    },
                    close: function(event, ui) {
                        $("body").removeClass('stop-scrolling');
                    }
                });
                $("#popup-password").dialog('option', 'dialogClass', 'dialog-noTitle');
                $("#btnPasswordSave").click(function() {
                    fn_PasswordSave();
                });
            });
            function fn_PopupPasswordChangeOpen() {
                $("#popup-password").dialog('open');
            }
            function fn_PopupPasswordChangeClose() {
                $("#popup-password").dialog("close");
            }
            function fn_PasswordSave() {
                if (isEmpty($("#password").val()) || $("#password").val().length < 4) {
                    toastr.options = {
                        "timeOut": 3000
                    }
                    toastr.warning("패스워드를 4글자 이상 입력해주세요");
                    //alert("패스워드를 4글자 이상 입력해주세요");
                    $("#password").focus();
                    return false;
                } else if (isEmpty($("#new_password").val()) || $("#new_password").val().length < 4) {
                    toastr.options = {
                        "timeOut": 3000
                    }
                    toastr.warning("변경 패스워드를 4글자 이상 입력해주세요");
                    //alert("변경 패스워드를 4글자 이상 입력해주세요");
                    $("#new_password").focus();
                    return false;
                } else if (isEmpty($("#new_password2").val()) || $("#new_password2").val().length < 4) {
                    toastr.options = {
                        "timeOut": 3000
                    }
                    toastr.warning("패스워드 확인를 4글자 이상 입력해주세요");
                    //alert("패스워드 확인를 4글자 이상 입력해주세요");
                    $("#new_password2").focus();
                    return false;
                } else if ($("#password").val() == $("#new_password").val()) {
                    toastr.options = {
                        "timeOut": 3000
                    }
                    toastr.warning("변경 패스워드가 기존 패스워드와 동일합니다.");
                    //alert("변경 패스워드가 기존 패스워드와 동일합니다.");
                    $("#new_password").focus();
                    return false;
                } else if ($("#new_password").val() != $("#new_password2").val()) {
                    toastr.options = {
                        "timeOut": 3000
                    }
                    toastr.warning("변경 패스워드와 패스워드 확인이 다릅니다.");
                    //alert("변경 패스워드와 패스워드 확인이 다릅니다.");
                    $("#new_password2").focus();
                    return false;
                } else {
                    var dataObj = {
                        password: $("#password").val(),
                        new_password: $("#new_password").val()
                    }
                    $.ajax({
                        type: "POST",
                        url: "/v2/password/change",
                        data: dataObj,
                        timeout: 30000, // sets timeout to 3 seconds
                        success: function(data, status) {
                            toastr.options = {
                                "timeOut": 5000
                            }
                            toastr.info(data.MSG);
                            //alert(data.MSG);
                            if (data.CODE == "0") {
                                fn_PopupPasswordChangeClose();
                                setTimeout(
                                    function() {
                                        location.href = '/v2/logout';
                                    }, 1000);
                            }
                        },
                        beforeSend: function() {},
                        complete: function() {},
                        error: function(data, status) {
                            toastr.options = {
                                "timeOut": 5000
                            }
                            toastr.error("패스워드 변경 실패");
                            //alert("패스워드 변경 실패");
                        }
                    });
                }
            }
        </script>
    </header>
    <div style="display: none;">
        <div id="dialog-popup-unpaid-message">
            <div class="popup_wrap">
                <div class="popup">
                    <div class="popup_head">
                        <h1 class="tit"></h1>
                        <button type="button" class="btn_close_popup btnUnpaidMessagePopupClose"><span class="invisible">팝업닫기</span></button>
                    </div>
                    <div class="popup_body" style="height: 480px;overflow-y: auto;">
                    </div>
                    <div class="butt_area4">
                        <button type="button" class="icClose buttonM btnUnpaidMessagePopupClose">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--// 헤더영역 -->
    <!-- 즐겨찾기 영역 -->
    <!--
<div id="bookmark">
	<h1>즐겨찾기 메뉴</h1>
	<ul class="cate">
		<li>
			<span onclick="">메뉴1</span>
			<button type="button" class="quick_close" onclick="">삭제</button>
		</li>
		<li>
			<span onclick="">메뉴2</span>
			<button type="button" class="quick_close" onclick="">삭제</button>
		</li>
	</ul>
</div>
-->
    <div id="bookmark" style="height: 5px;">
    </div>
    <!--// 즐겨찾기 영역 -->
    <!-- 컨텐츠 영역 -->
    <div id="contents">
        <!-- 왼쪽 메뉴 영역 -->
        <div id="snb">
            <h2 class="snb_tit">
                <span class="icon_snb_top">게시판</span>
            </h2>
            <ul>
                <li class="sub-depth menu-board"><a href="javascript:movePage('menu-board-notice3');" class="active">게시판<span class="arrow"></span></a>
                    <ul class="snb_smenu">
                        <li class="menu-list menu-board-notice3"><a href="javascript:movePage('menu-board-notice3');" class="active">공지사항V3 (신버전)</a></li>
                        <li class="menu-list menu-board-notice"><a href="javascript:movePage('menu-board-notice');">공지사항 (구버전)</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--// 왼쪽 메뉴 영역 -->
        <!-- 오른쪽 컨텐츠 -->
        <div id="contents_body">
            <div class="location">
                <ul>
                    <li>게시판</li>
                    <li><strong>공지사항V3</strong></li>
                </ul>
            </div>
            <!--  컨텐츠 -->
            <div class="cont_area">
                <form method="get" accept-charset="utf-8" id="searchForm" name="searchForm">
                    <input type="hidden" name="pageNo" id="pageNo" value="1">
                    <!-- 검색 -->
                    <div class="table_body">
                        <table summary="" class="tInsert">
                            <caption></caption>
                            <colgroup>
                                <col width="170px">
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">키워드 검색</th>
                                    <td>
                                        <input type="text" class="p40" name="searchKeyword" id="searchKeyword" value="" placeholder="제목을 입력하세요.">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- 검색 -->
                    <script>
                        $(document).ready(function() {
                        });
                    </script>
                    <div class="table_body">
                        <table summary="" class="tInsert">
                            <caption></caption>
                            <colgroup>
                                <col width="170px">
                                <col width="*">
                            </colgroup>
                        </table>
                    </div>
                    <!-- //검색 -->
                    <!-- 버튼 -->
                    <script>
                        $(document).ready(function() {
                            $("#btnSearch").click(function() {
                                search();
                            });
                            $("#btnExcel").click(function(e) {
                                excel();
                            });
                            $("#btnExcel2").click(function(e) {
                                excel2();
                            });
                            $("#btnExcelUpload").click(function(e) {
                                excelUpload();
                            });
                            $("#btnExcelUpload2").click(function(e) {
                                excelUpload2();
                            });
                            $("#btnPrint").click(function(e) {
                                fn_Print();
                            });
                            $("#btnCalendarView").click(function(e) {
                                fn_CalendarView();
                            });
                            $("#btnAlimTalk").click(function(e) {
                                fn_AlimTalk();
                            });
                        });
                    </script>
                    <div class="butt_area1">
                        <button type="button" class="buttonM icSearch" id="btnSearch">검색하기</button>
                    </div>
                    <!-- //버튼 -->
                    <ul class="tabs_s">
                        <li class="active">전체</li>
                    </ul>
                    <!-- 게시글분류 -->
                    <script>
                        $(document).ready(function() {
                            $("#pageSize").change(function() {
                                search();
                            });
                            $("#groupField").change(function() {
                                search();
                            });
                        });
                    </script>
                    <div class="sort_area">
                        <p class="page">Total: <span class="red" id="list_totalCount">0</span>ea , <span class="red" id="list_pageNo">1</span> of <span class="red" id="list_finalPageNo">0</span> Pages</p>
                        <p class="sort">
                            <select name="pageSize" id="pageSize">
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30" selected="selected">30</option>
                                <option value="31">31</option>
                                <option value="40">40</option>
                                <option value="50">50</option>
                                <option value="60">60</option>
                                <option value="70">70</option>
                                <option value="100">100</option>
                            </select>
                            <span style="line-height: 28px;vertical-align: middle;">개씩 보기</span>
                        </p>
                    </div>
                    <!-- //게시글분류 -->
                </form>
                <form method="post" accept-charset="utf-8" id="listForm" name="listForm">
                    <div class="table_body" style="margin-bottom: 15px;">
                        <table class="tList tList35" id="tableList">
                            <caption></caption>
                            <colgroup>
                                <col width="100px">
                                <col width="*">
                                <col width="160px">
                                <col width="160px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>작성자</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="tr-sum">
                                    <td colspan="99"><strong class="b">공지사항이 없습니다.</strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
        <!--// 오른쪽 컨텐츠 -->
    </div>
    <!--// 컨텐츠 영역 -->
    <!-- 푸터영역 -->
    <footer id="footer">
        <p class="logo"><img src="/images/common/footer_logo.png" alt="주식회사 유니온소프트"></p>
        <address>
            TEL : 1566-4261<span></span><span></span>관리자 : 유용준<br>
            Copyright ©2018 <a href="http://unionpos.co.kr" target="_blank"><b>UnionSoft</b></a> All rights reserved.
        </address>
    </footer>
    <!--// 푸터영역 -->
    <div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable dialog-noTitle" tabindex="-1" role="dialog" aria-labelledby="ui-id-1" style="display: none; outline: 0px; z-index: 1000;">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-1" class="ui-dialog-title">&nbsp;</span><a href="#" class="ui-dialog-titlebar-close ui-corner-all" role="button"><span class="ui-icon ui-icon-closethick">close</span></a></div>
        <div id="popup-password" style="" class="ui-dialog-content ui-widget-content">
            <div class="popup_wrap">
                <!-- 팝업 -->
                <div class="popup">
                    <div class="popup_head">
                        <h1 class="tit">패스워드 변경</h1>
                        <button type="button" class="btn_close_popup btnPasswordPopupClose"><span class="invisible">팝업닫기</span></button>
                    </div>
                    <div class="popup_body">
                        <div class="table_body mgb25">
                            <form>
                                <table class="tInsert">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="160px">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>기존 패스워드</th>
                                            <td>
                                                <input type="password" class="w152" id="password" name="password" title="패스워드" placeholder="기존 패스워드" value="" autocomplete="off">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>변경 패스워드</th>
                                            <td>
                                                <input type="password" class="w152" id="new_password" name="new_password" title="패스워드" placeholder="변경 패스워드" value="" autocomplete="off">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>패스워드 확인</th>
                                            <td>
                                                <input type="password" class="w152" id="new_password2" name="new_password2" title="패스워드" placeholder="패스워드 확인" value="" autocomplete="off">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div class="butt_area4">
                        <button class="buttonM bGreen" type="button" id="btnPasswordSave">저장</button>
                        <button class="icClose buttonM btnPasswordPopupClose" type="button">닫기</button>
                    </div>
                </div>
                <!--// 팝업 -->
            </div>
        </div>
    </div>
</body>
</html>