@extends('layouts.layouts')
@section('title')
    {{$menu->name}}
@endsection
@section('style')
    <link rel="stylesheet" type="text/css" href="{{asset('assets/page/example.css')}}">
@endsection
@include('layouts.nav_1')
@section('body')
    <div class="main">
        <div class="container">

        </div>
    </div>
@endsection
@include('layouts.footer')