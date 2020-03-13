<?php

namespace App\Repositories\Model;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model {
    protected $connection = 'mysql';
    protected $table = 'menu';
    protected $primaryKey = 'id';

    protected $guarded = [];
    public $timestamps = false;
}