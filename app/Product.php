<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    // protected $table = 'products';
    protected $fillable = ['product_name','price','description','product_rate','stock','weight','deleted_at'];


    public function product_image()
    {
        return $this->hasMany('App\Product_Image','product_id','id');
    }
}