@extends('layouts.admin')
@section('style')
    <link href="{{asset('css/plugins/dropzone/dropzone.css')}}" rel="stylesheet">
    <link href="{{asset('css/plugins/dataTables/dataTables.bootstrap.css')}}" rel="stylesheet">
@endsection
@section('content')
    <div id="wrapper">
        @include('admin.nav')
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="wrapper wrapper-content animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>banner管理</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-content">
                                            <div class="">
                                                <a onclick="addBanner();" href="javascript:void(0);"
                                                   class="btn btn-primary ">添加banner</a>
                                            </div>
                                            <table class="table table-striped table-bordered table-hover "
                                                   id="banner-table">
                                                <thead>
                                                <tr>
                                                    <th>id</th>
                                                    <th class="col-lg-2 col-md-2 col-sm-2">图片预览</th>
                                                    <th>图片url</th>
                                                    <th>图片alt</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                {{--@if($banner)--}}
                                                {{--@foreach($banner as $image)--}}
                                                {{--<tr>--}}
                                                {{--<td>{{$image->id}}</td>--}}
                                                {{--<td>{{$image->typeDescription()}}</td>--}}
                                                {{--<td><img src="{{asset($image->url)}}" class="img-responsive"></td>--}}
                                                {{--<td>{{asset($image->url)}}</td>--}}
                                                {{--<td class="center">{{$image->url}}</td>--}}
                                                {{--<td class="center">删除</td>--}}
                                                {{--</tr>--}}
                                                {{--@endforeach--}}
                                                {{--@endif--}}
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form id="my-awesome-dropzone" class="dropzone" action="{{route('banner')}}"
                                      method="post" enctype="multipart/form-data">
                                    <div class="dropzone-previews"></div>
                                    <button type="submit" class="btn btn-primary pull-right">提交</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection

@section('script')
    <!-- DROPZONE -->
    <script src="{{asset('js/plugins/dropzone/dropzone.js')}}"></script>
    <!-- Data Tables -->
    <script src="{{asset('js/plugins/jeditable/jquery.jeditable.js')}}"></script>
    <script src="{{asset('js/plugins/dataTables/jquery.dataTables.js')}}"></script>
    <script src="{{asset('js/plugins/dataTables/dataTables.bootstrap.js')}}"></script>

    <script>
        $(document).ready(function () {
            let page = "{{request()->get('page')?:1}}"

            /* Init DataTables */
            var oTable = $('#banner-table').dataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable('{{url('/admin/banner/')}}/' + page, {
                "callback": function (sValue, y) {
                    console.log(sValue);
                    var aPos = oTable.fnGetPosition(this);
                    oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                },
                "submitdata": function (value, settings) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition(this)[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            });
            var content='';
            $.ajax({
                'url': '{{url('/admin/banner/')}}/' + page,
                'method': 'get',
                'dataType': 'json',
                'success': function (banners) {
                    $.each(banners, function (index, banner) {
                        content += '<tr>\n' +
                            '    <td>' + banner.id + '</td>\n' +
                            '    <td><img src="' + banner.url + '" class="img-responsive"></td>\n' +
                            '    <td>' + banner.url + '</td>\n' +
                            '    <td class="center">' + banner.alt + '</td>\n' +
                            '    <td class="center">删除</td>\n' +
                            '</tr>'
                    })
                    $('#banner-table tbody').html(content);
                }
            })

            Dropzone.options.myAwesomeDropzone = {

                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 100,
                maxFiles: 100,

                // Dropzone settings
                init: function () {
                    var myDropzone = this;

                    this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                        e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    });
                    this.on("sendingmultiple", function () {
                    });
                    this.on("successmultiple", function (files, response) {
                    });
                    this.on("errormultiple", function (files, response) {
                    });
                }

            }

        });

        function addBanner() {
            $('#banner-table').dataTable().fnAddData([
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row"]);
        }

    </script>
@endsection