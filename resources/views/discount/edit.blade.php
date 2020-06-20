@extends('masterviews.layout')

@section('content')

    <div class="row">
        <!-- coloum for name of page -->
        <div class="col-lg-12">
            <h1> Discount Edit </h1>

        <form action="/discount/update/{{$discount->id}}" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">Product ID</label>
                    <input name="id_product" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Product ID" value="{{$discount->id_product}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Percentage</label>
                    <input name="percentage" type="text" class="form-control" aria-describedby="emailHelp" placeholder="price" value="{{$discount->percentage}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Start</label>
                    <input name="start" type="date" class="form-control" aria-describedby="emailHelp" placeholder="yyyy-mm-dd" value="{{$discount->start}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">End</label>
                    <input name="end" type="date" class="form-control" aria-describedby="emailHelp" placeholder="yyyy-mm-dd" value="{{$discount->end}}">
                </div>
            </div>
            <div class="modal-footer col-12 float-left">
                <a href="/discount" class="btn btn-secondary">Back</a>
                <button type="submit" class="btn btn-primary btn-warning">Update Discount</button>
        </form>
        </div>

@endsection



