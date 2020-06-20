<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CourierController extends Controller
{
    public function index()
    {
        $courier = \App\Courier::all();
        return view('courier.index',['courier'=>$courier]);
    }

    public function create(Request $request)
    {
        \App\courier::create($request->all());
        return redirect('/courier')->with('success','Courier Added successfully:)');
    }
    
    public function edit($id)
    {
        $courier= \App\courier::find($id);
        return view('/courier/edit',['courier'=>$courier]);
    }

    public function update(Request $request,$id)
    {
        $courier= \App\courier::find($id);
        $courier->update($request->all());
        return redirect('/courier')->with('success','Courier Updated Successfully:)');
    }

    public function delete(Request $request, $id)
    {
        $courier= \App\courier::find($id);
        $courier->delete($request->all());
        return redirect('/courier')-with('success','Courier Delete Successfully:(');
    }
}
