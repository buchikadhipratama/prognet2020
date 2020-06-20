<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    protected $fillable = ['id','id_product','percentage','start,end','created_at','updated_at'];
}
