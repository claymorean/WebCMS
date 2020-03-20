@extends('layouts.admin')
@section('content')
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                {{--<h1 class="logo-name">{{ config('app.name', 'Laravel') }}</h1>--}}

            </div>
            <h3>欢迎使用 {{ config('app.name', 'Laravel') }}</h3>

            <form class="m-t" role="form" action="{{ route('login') }}" method="post">
                @csrf
                <div class="form-group">
                    <input type="username" class="form-control" name="username" placeholder="用户名" required="" autofocus>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="密码" required autocomplete="current-password">
                    @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-label" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                        <label class="form-check-label" for="remember">
                            {{ __('Remember Me') }}
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>

            </form>
        </div>
    </div>
@endsection