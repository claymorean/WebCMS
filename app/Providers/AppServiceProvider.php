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
        $configs = $configs->all()->toArray();
        view()->share('configs', (object) array_combine(array_column($configs, 'key'), array_column($configs, 'value')));
    }
}
