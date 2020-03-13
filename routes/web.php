<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});


Route::get('/{route?}', 'IndexController@page');

//Auth::routes();
//Route::get('/verifyCode', 'LoginController@verifyCode')->middleware('web');
//$locales = [
//    'en',
//    'ru',
//];
//
//foreach ($locales as $locale) {
//    Route::group(['prefix' => $locale], function() {
//        Route::get('route1',function(){});
//        Route::post('route1',function(){});
//    });
//} return false;
Route::group(['prefix' => 'admin'], function () {
    Route::group(['namespace' => 'Auth'], function () {
        Route::get('/login', 'LoginController@showLoginForm')->name('login');
        Route::post('/login', 'LoginController@login');
        Route::get('/logout', 'LoginController@logout');
        Route::get('/register', 'RegisterController@showRegistrationForm')->name('register');;
        Route::post('/register', 'RegisterController@register');
        Route::post('/resetPass', ['uses' => 'UserController@resetPassword']);
    });

    Route::group(['namespace' => 'Admin', 'middleware' => 'auth'], function () {
        Route::get('/', function () {
            return view('welcome');
        });
    });
});
