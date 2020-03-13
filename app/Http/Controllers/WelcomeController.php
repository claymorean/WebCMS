<?php

namespace App\Http\Controllers;

use App\Libaries\SelfClass;

class WelcomeController extends Controller
{
    function index(){
        // $test = new SelfClass();
        // $test->index();
        return view('welcome');
    }
}