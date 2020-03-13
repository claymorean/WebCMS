<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IndexController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function page($route='')
    {
        switch ($route){
            case '':
                return view('index');
            case 'solutions':
                return view('solutions');
        }
    }
}
