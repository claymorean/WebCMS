@extends('layouts.layouts_1')
@section('title')
    首页
@endsection
@section('style')
    <link rel="stylesheet" type="text/css" href="{{asset('assets/page/example.css')}}">
@endsection
@include('layouts.nav_1')
@include('layouts.swiper')
@section('body')
    <div class="container">
        <div class="row">
            <div class="col-sm-12 main-title">
                <h1>物联网解决方案</h1>
            </div>
            <div class="col-sm-12 solves">
                <div class="col-sm-6 main-title">
                    <a href="car_solutions.html" class="thumbnail ">
                        <img src="{{asset('assets/image/solve_1.png')}}" class="img-rounded">
                    </a>
                    <h4>工程机械机联网整体解决方案</h4>
                </div>
                <div class="col-sm-6 main-title">
                    <a href="home_solutions.html" class="thumbnail">
                        <img src="{{asset('assets/image/solve_4.png')}}" class="img-rounded">
                    </a>
                    <h4>智能家居安防整体解决方案</h4>
                </div>
            </div>
            <div class="col-sm-12 solves">
                <div class="col-sm-6 main-title">
                    <a href="city_solutions.html" class="thumbnail">
                        <img src="{{asset('assets/image/solve_2.png')}}" class="img-rounded">
                    </a>
                    <h4>城市客运及安全协同解决方案</h4>
                </div>
                <div class="col-sm-6 main-title">
                    <a href="logistics_solutions.html" class="thumbnail">
                        <img src="{{asset('assets/image/solve_3.png')}}" class="img-rounded">
                    </a>
                    <h4>物流货运安全协同解决方案</h4>
                </div>
            </div>
        </div>
    </div>
@endsection
@include('layouts.footer')