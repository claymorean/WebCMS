@extends('layouts.layouts')
@section('title')
    {{$menu->name}}
@endsection
@section('style')
    <link rel="stylesheet" type="text/css" href="{{asset('assets/page/example.css')}}">
@endsection
@include('layouts.nav_'.$configs->nav_type)
@section('body')
    <div class="main">
        <div class="container">
            <div class="row">
                <div class="media col-md-12">
                    <div class="col-md-4">
                        <h1 class="solution_title">工程机械机联网整体解决方案</h1>
                        <div class="solution_content">
                            <p>工时和油耗实时统计；</p>
                            <p>围栏和故障实时预警；</p>
                            <p> 施工现场远程可视化掌控；</p>
                            <p>电子月报统计分析；</p>
                            <p>利用物联网和移动可视化技术，以实时、准确的数据支撑，帮助用户实现机队的远程可视化和业务精细化管理。</p>
                            <p>
                                <a href="car_solutions.html">
                                    <img src="img/solution_more.png" class="img-rounded">
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-8">
                    <span class="thumbnail">
                        <img class="media-object img-rounded" src="img/solve_1.png">
                    </span>
                    </div>
                </div>
                <div class="media col-md-12">
                    <div class="col-md-8">
                    <span href="#" class="thumbnail">
                        <img class="media-object img-rounded" src="img/solve_4.png">
                    </span>
                    </div>
                    <div class="col-md-4">
                        <h1 class="solution_title">智能家居安防整体解决方案</h1>
                        <div class="solution_content">
                            <p>具备IoT属性的智能安防终端产品；</p>
                            <p>定制化手机APP应用；</p>
                            <p>综合业务管理云平台；</p>
                            <p>实现安防智能化和信息化管理，为传统安防企业赋能；</p>
                            <p>
                                <a href="home_solutions.html">
                                    <img src="img/solution_more.png" class="img-rounded">
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="media col-md-12">
                    <div class="col-md-4">
                        <h1 class="solution_title">城市客运及安全协同解决方案</h1>
                        <div class="solution_content">
                            <p>驾驶安全保障；</p>
                            <p>车身全景监控；</p>
                            <p>车载Wifi；</p>
                            <p>车辆防盗；</p>
                            <p>智能车载安防产品配置了360°电驱动镜头、4G车载路由、多种传感器和一键报警按钮等功能，为城市安全管控提供协同和支持。</p>
                            <p>
                                <a href="city_solutions.html">
                                    <img src="img/solution_more.png" class="img-rounded">
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-8">
                    <span class="thumbnail">
                        <img class="media-object img-rounded" src="img/solve_2.png">
                    </span>
                    </div>
                </div>
                <div class="media col-md-12">
                    <div class="col-md-8">
                    <span href="#" class="thumbnail">
                        <img class="media-object img-rounded" src="img/solve_3.png">
                    </span>
                    </div>
                    <div class="col-md-4">
                        <h1 class="solution_title">物流货运安全协同解决方案</h1>
                        <div class="solution_content">
                            <p>驾驶安全保障；</p>
                            <p>驾驶人员远程可视化交互；</p>
                            <p>货物视频监控；</p>
                            <p>车辆实时定位和车辆防盗；</p>
                            <p>业务管理云平台；</p>
                            <p>多功能车载智能终端，为物流货运业务提供协同和支持。</p>
                            <p>
                                <a href="logistics_solutions.html">
                                    <img src="img/solution_more.png" class="img-rounded">
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@include('layouts.footer')