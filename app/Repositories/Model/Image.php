<?php

namespace App\Repositories\Model;

use Illuminate\Database\Eloquent\Model;

class Image extends Model {
    protected $table = 'images';
    protected $primaryKey = 'id';

    protected $guarded = [];
    public $timestamps = false;

    public function typeDescription() {
        $typeDescription = [
            0 => 'none',
            1 => 'banner'
        ];
        return ($this->typeDescription = $typeDescription[ $this->type ]);
    }
}