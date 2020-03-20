<?php
/**
 * Created by PhpStorm.
 * User: senuer
 * Date: 2020/3/12
 * Time: 17:36
 */

namespace App\Repositories;

use App\Repositories\Model\Image;

class ImageRepository implements RepositoryInterface {
    public function __construct() {
        $this->setModel();
    }

    public function setModel() {
        $this->model = new Image;
    }

    public function getModel() {
        // TODO: Implement getModel() method.
        return $this->model;
    }

    public function banner($page = 1) {
        return $this->model
            ->where('type', 1)
            ->skip(($page-1)*env('PER_PAGE'))
            ->take(env('PER_PAGE'))
            ->get();
    }

    public function all() {
        return $this->model->orderBy('id')->get();
    }
}