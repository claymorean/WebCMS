<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>@yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="keywords" content="{{$configs->web_keywords}}">
    <meta name="description" content="{{$configs->web_description}}">

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
