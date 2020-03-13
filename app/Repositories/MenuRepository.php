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
    public function __construct(Menu $menu) {
        $this->menu = $menu;
    }

    public function firstMenuRoute() {
        return array_column($this->firstMenu()->toArray(), 'route');
    }

    public function firstMenu() {
        return $this->menu->where('parent_id', 0)->orderBy('order', 'asc')->get();
    }

    public function childrenMenu($id) {
        return $this->menu->where('parent_id', $id)->orderBy('order', 'asc')->get();
    }
}