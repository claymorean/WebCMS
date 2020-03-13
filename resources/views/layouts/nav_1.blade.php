@inject('menus','App\Repositories\MenuRepository')
@section('nav')
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"
                        aria-expanded="true">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="{{asset('assets/image/logo1.png')}}" title="喵星科技"
                                                               alt="喵星科技"></a>
            </div>
            <div class="navbar-collapse collapse" id="myNavbar" aria-expanded="true" style="">
                <ul class="nav navbar-nav">
                    @foreach($menus->firstMenu() as $menu)
                        @if(!($childrenMenus=$menus->childrenMenu($menu->id))->isEmpty())
                            <li role="presentation" class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    {{$menu->name}}
                                </a>
                                <ul class="dropdown-menu">
                                    @foreach($childrenMenus as $childrenMenu)
                                        <li><a href="{{url($menu->route.$childrenMenu->route)}}">{{$childrenMenu->name}}</a></li>
                                    @endforeach
                                </ul>
                            </li>
                        @else
                            <li class="first-nav"><a href="{{url($menu->route)}}" data-href="{{$menu->route}}">{{$menu->name}}</a></li>
                        @endif
                    @endforeach
                    <li><a href="javascript:void(0)" class="login_menu"><img src="{{asset('assets/image/phone.png')}}">025-52233243</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
@endsection