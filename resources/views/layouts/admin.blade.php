<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <link rel="stylesheet" type="text/css" href="{{asset('assets/bootstrap/bootstrap.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('css/animate.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('css/style.css?v=2.2.0')}}">
    <!-- Morris -->
    <link href="{{asset('css/plugins/morris/morris-0.4.3.min.css')}}" rel="stylesheet">
    <link href="{{asset('assets/font-awesome/css/font-awesome.css?v=4.3.0')}}" rel="stylesheet">

    <!-- Gritter -->
    <link href="{{asset('js/plugins/gritter/jquery.gritter.css')}}" rel="stylesheet">
    @yield('style')
    <script type="text/javascript" src="{{url('assets/jquery/jquery.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('assets/bootstrap/bootstrap.min.js')}}"></script>

</head>
<body>
@yield('content')
<script src="{{asset('js/plugins/metisMenu/jquery.metisMenu.js')}}"></script>
<script src="{{asset('js/plugins/slimscroll/jquery.slimscroll.min.js')}}"></script>

<!-- Custom and plugin javascript -->
<script src="{{asset('js/hplus.js')}}"></script>
<script src="{{asset('js/plugins/pace/pace.min.js')}}"></script>
<script>
    let curPath=window.location.pathname;
    $('.nav li[data-active-route="'+curPath+'"]').addClass('active').siblings('li').removeClass('active');
</script>
@yield('script')
</body>
</html>
