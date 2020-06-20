<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product_Category extends Model
{
    protected $table = 'categories';
    protected $fillable = ['category_name','id','deleted_at'];
}
