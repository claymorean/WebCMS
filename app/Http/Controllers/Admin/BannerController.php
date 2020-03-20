<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\ImageRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BannerController extends Controller {

    public function __construct(ImageRepository $imageRepository) {
        $this->imageRepository = $imageRepository;
    }

    public function index() {
        return view('admin.banner');
    }

    public function getBanners($page) {
        return json_encode($this->imageRepository->banner($page), JSON_UNESCAPED_UNICODE);
    }
}
