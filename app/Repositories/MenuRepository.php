<?php
/**
 * Created by PhpStorm.
 * User: senuer
 * Date: 2020/3/12
 * Time: 17:36
 */

namespace App\Repositories;

use App\Repositories\Model\Menu;

class MenuRepository implements RepositoryInterface {

    public function __construct() {
        $this->setModel();
    }

    public function setModel() {
        $this->model = new Menu;
    }

    public function getModel() {
        // TODO: Implement getModel() method.
        return $this->model;
    }

    public function firstMenuRoute() {
        return array_map(function ($menu) {
            return substr($menu[ 'route' ], 1);
        }, $this->firstMenu()->toArray());
    }

    public function firstMenu() {
        return $this->model->where('parent_id', 0)->orderBy('order', 'asc')->get();
    }

    public function childrenMenu($id) {
        return $this->model->where('parent_id', $id)->orderBy('order', 'asc')->get();
    }

    public function findByRoute($route) {
        return $this->model->where('route', $route)->first();
    }
}