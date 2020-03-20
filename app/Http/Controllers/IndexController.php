<?php

namespace App\Http\Controllers;

use App\Repositories\ConfigRepository;
use App\Repositories\MenuRepository;
use Illuminate\Http\Request;

class IndexController extends Controller {
    public function __construct(MenuRepository $menuRepository,ConfigRepository $configRepository) {
        $this->menuRepository = $menuRepository;
        $this->configRepository = $configRepository;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function firstPage($route = '') {
        if ($route == '')
            return view('index');
        elseif (($menu = $this->menuRepository->findByRoute('/'.$route)) && $menu->type == 1)
            return view('common', compact('menu'));
        else
            return view($route);
    }

    public function secondPage($firstRoute, $secondRoute) {
        $menu = $this->menuRepository->findByRoute('/'.$secondRoute);
        if ($menu->type == 1)
            return view('second', compact('menu'));
        else
            return view($secondRoute);
    }
}
