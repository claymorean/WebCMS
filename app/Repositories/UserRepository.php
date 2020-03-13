<?php
/**
 * Created by PhpStorm.
 * User: senuer
 * Date: 2020/3/12
 * Time: 17:36
 */

namespace App\Repositories;

use App\Repositories\Model\User;

class UserRepository implements RepositoryInterface {
    public function __construct(User $user) {
        $this->user = $user;
    }
}