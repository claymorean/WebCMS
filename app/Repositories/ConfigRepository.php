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
    public function __construct() {
        $this->setModel();
    }

    public function setModel() {
        $this->model = new Config;
    }

    public function getModel() {
        // TODO: Implement getModel() method.
        return $this->model;
    }

    public function all() {
        return $this->model->orderBy('id')->get();
    }

    public function format() {
        $configs = $this->all()->toArray();
        return (object) array_combine(array_column($configs, 'key'), array_column($configs, 'value'));
    }
}