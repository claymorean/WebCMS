<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>@yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="description"
          content="南京喵星科技（www.mplanet.cn）是一家专注于车载智能硬件研发设计，集制造、销售和服务为一体的移动互联网科技公司。喵星旨在利用前沿的计算机视觉、移动互联网技术以及业内领先的软硬件设计和工业设计经验，通过颠覆式的智能汽车产品服务，带给用户更有趣、更智慧、更方便、更人性的极致车生活体验。"/>
    <meta name="keywords" content="mplanet,meowcloud,喵小瞳,喵星科技,喵星"/>
    <link rel="stylesheet" type="text/css" href="{{asset('assets/bootstrap/bootstrap.css')}}">
    @yield('style')
    <script type="text/javascript" src="{{url('assets/jquery/jquery.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('assets/bootstrap/bootstrap.js')}}"></script>
</head>
<body id="show">
@yield('nav')
@yield('swiper')
@yield('body')
@yield('footer')
@yield('scripts')
<script>
    let curPath=window.location.pathname;
    $(document).ready(function() {
        $('.nav li.first-nav a[data-href="'+curPath+'"]').addClass('nav_active');
        $('.navbar-default .navbar-nav > li:last-of-type > a').hover(function(){
            $(this).children('img').attr('src','img/phone_blue.png');
        },function () {
            $(this).children('img').attr('src','img/phone.png');
        })
    });
</script>
</body>
</html>
