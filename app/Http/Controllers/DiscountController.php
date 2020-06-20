<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DiscountController extends Controller
{
    public function index()
    {
        $discount= \App\discount::all();
        return view ('discount.index',['discount'=>$discount]);
    }

    public function create(Request $request)
    {
        $discount = new \App\discount;
        $discount->id_product = $request->id_product;
        $discount->percentage = $request->percentage;
        $discount->start = $request->start;
        $discount->end = $request->end;
        $discount->created_at = date('Y-m-d H:i:s');
        $discount->updated_at = date('Y-m-d H:i:s');
        $discount->save();

        
        // \App\discount::create($request->all());
        return redirect('/discount')->with('success','Discount Created Successfully:)');

    }

    public function edit($id)
    {
        $discount = \App\discount::find($id);
        return view ('/discount/edit',['discount'=>$discount]);
    }

    public function update(Request $request, $id)
    {
        $discount = \App\discount::find($id);
        $discount->update($request->all());
        return redirect('/discount')->with('success','Discount Updated Successfully:)');
    }

    public function delete($id)
    {
        $discount = \App\discount::find($id);
        $discount->delete($discount);
        return redirect('/discount')->with('success','Discount Deleted Successfully:(');
    }
}
