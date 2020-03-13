<?php
/**
 * Created by PhpStorm.
 * User: senuer
 * Date: 2020/3/12
 * Time: 17:36
 */

namespace App\Repositories;

use App\Repositories\Model\Config;

class ConfigRepository implements RepositoryInterface {
    public function __construct(Config $config) {
        $this->config = $config;
    }

    public function all() {
        return $this->config->orderBy('id')->get();
    }
}