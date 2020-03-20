<?php

namespace App\Providers;

use App\Repositories\ConfigRepository;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider {
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register() {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot(ConfigRepository $configs) {
        view()->share('configs', $configs->format());
    }
}
