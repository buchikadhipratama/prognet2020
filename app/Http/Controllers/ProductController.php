<?php

// use App\Product;

namespace App\Http\Controllers;
use App\Product_Images;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    
    public function index()
    {
        $product_data = \App\Product::where ('deleted_at',NULL)->get();
        return view ('product.index',['product_data'=>$product_data] );
    }

    public function create(Request $request)
    {
        $this->validate($request,[
            'product_name' => 'required|nullable|distinct',
            'product_images.*' => [ 'mimes:jpg,jpeg,png', 'max:2000'],
            'price' => ['required', 'regex:/^\d+(\.\d{1,2})?$/'],
            'description' => ['required'],
            'product_rate' => ['required','max:1'],
            'stock' => ['required','max:8'],
            'weight' => ['required','max:3'],
        ],[
            'product_name.required' => 'Please enter the name of the product that you want to add',
            'price.required' => 'please enter the price of the product that you want to add',
            'description.required' => 'please enter a description for this product',
            'product_rate.required' => 'please enter the rate of the product ',
            'stock.required' => 'incoming product stock may not be blank',
            'weight.required' => 'enter item weight',
        ]);

        if($request->hasFile('product_images')){
            $product = new \App\Product;
            $product->product_name = $request->product_name;
            $product->price= $request->price;
            $product->description= $request->description;
            $product->product_rate= $request->product_rate;
            $product->stock= $request->stock;
            $product->weight= $request->weight;
            $product->deleted_at=null;
            $product->save();

            $product = DB::table('products')->where('product_name','=', $request->product_name)->first();
            foreach($request->file('product_images') as $file){
                $name = time().'_.'.$file->extension();
                $file->move("product_images/", $name);
                $product_image = new \App\Product_Image();
                $product_image->product_id = $product->id;
                $product_image->image_name=$name;
                $product_image->save();
            }
            return redirect('/product')->with('success','Product added successfully:)');
        }
        return redirect()->back()-withInput($request->only('product_name','price','description','product_rate','stock','weight'))->with('success','periksa lagi, TOlong)');


        // \App\Product::create($request->all());
        // return redirect('/product')->with('success','Product added successfully:)');
    }

    public function edit($id)
    {
        $product = \App\Product::find($id);


        $products= DB::table('products')->join('product_images', 'products.id', '=', 'product_images.product_id')
            ->select('product_images.*')->where('products.id', '=', $id)
            ->get();
            
        return view('product/edit',compact('product','products'));
    }

    public function update (Request $request, $id)
    {
        $product = \App\Product::find($id);
        $product->update($request->all());
        return redirect('/product')->with('success','Product updated successfully:)');
    }

    public function delete (Request $request, $id)
    {
        $product = \App\Product::find($id);
        $product->deleted_at=date("Y-m-d H:i:s");;
        $product->save();
        return redirect('/product')->with('success','Product deleted successfully:(');
    }

    public function images($id)
    {
        // $product = \App\Product::find($id);
        // $images =  DB::table('products')
        // ->join('product_images','product_images.product_id'.'products.$id')
        // ->select('product_images.$id')
        // ->get();
        // dd($id);
        // // return dd($images);
        // return view('masterviews.foto');
        // return view('product/images',['images'=> $product]);

        $products= DB::table('products')->join('product_images', 'products.id', '=', 'product_images.product_id')
                    ->select('product_images.*')->where('products.id', '=', $id)
                    ->get();


        // $product_image->\App\Product->id;
        return view('masterviews.foto',compact('products'));
    }

    public function deleteimage($id)
    {
        $product = \App\Product::find($id);
        $product_image = \App\Product_Image::find($id);

        $products= DB::table('products')->join('product_images', 'products.id', '=', 'product_images.product_id')
                    ->select('product_images.*')->where('products.id', '=', $id)
                    ->get();
        $product_image->delete($product_image);
        return redirect('/product',compact('product','products'))->with('success','Product Image Deleted Successfully:(');
    }
}