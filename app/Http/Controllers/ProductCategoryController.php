<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductCategoryController extends Controller
{

    public function index()
    {
        $product_category = \App\Product_Category::where('deleted_at',NULL)->get();
        return view ('product-category.index',['product_category'=>$product_category]);
    }

    public function create(Request $request)
    {
        \App\Product_Category::create($request->all());
        return redirect('/product-category')->with('success','Product Category Added Successfully:)');
    }

    public function edit($id)
    {
        $product_category = \App\Product_Category::find($id);
            // return('buchik gantenng');
        return view ('/product-category.edit',['product_category' => $product_category]);
    }

    public function update(Request $request, $id)
    {
        $product_category = \App\Product_Category::find($id);
        $product_category->update($request->all());
        return redirect('/product-category')->with('success','Product Category Updated Successfully:)');
    }

    public function delete(Request $request, $id)
    {
        $product_category = \App\Product_Category::find($id);
        $product_category->deleted_at=date('Y-m-d H:i:s');
        $product_category->save();
        return redirect('/product-category')->with('success','Product Category Delete Successfully:(');
    }
}