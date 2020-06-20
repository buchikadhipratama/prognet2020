<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductImageController extends Controller
{
    //semangskat

    public function index()
    {
        $product_image = \App\Product_Image::all();
        return view('product-image.index',['product_image'=>$product_image]);
    }

    public function create(Request $request)
    {
        \App\Product_Image::create($request->all());
        return redirect('/product-image')->with('success','Product Image Added Successfully:)');
    }

    public function edit($id)
    {
        $product_image = \App\Product_Image::find($id);
        return view('product-image.edit',['product_image'=>$product_image]);
    }

    public function update(Request $request, $id)
    {
        $product_image = \App\Product_Image::find($id);
        $product_image->update($request->all());
        return redirect('/product-image')->with('success','Product Image Updated Successfully:)');
    }

    public function delete($id)
    {
        $product_image = \App\Product_Image::find($id);
        $product_image->delete($product_image);
        return redirect('/product-image')->with('success','Product Image Deleted Successfully:(');
    }

    public function deleteimage($id)
    {
        $product_image = \App\Product_Image::find($id);
        $product_image->delete($product_image);
        return redirect('/product')->with('success','Product Image Deleted Successfully:(');
    }


}
