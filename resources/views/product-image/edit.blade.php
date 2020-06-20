@extends('masterviews.layout')

@section('content')

    <div class="row">
        <!-- coloum for name of page -->
        <div class="col-lg-12">
            <h1> Product Image Edit </h1>

        <form action="/product-image/update/{{$product_image->id}}" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">Product ID</label>
                    <input name="product_id" type="text" class="form-control"  placeholder="Prouct Name" value="{{$product_image->product_id}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Image name</label>
                    <input name="image_name" type="text" class="form-control"   placeholder="Image Name" value="{{$product_image->image_name}}">
                </div>
            </div>
            <div class="modal-footer col-12 float-left">
                <a href="/product-image" class="btn btn-secondary">Back</a>
            <button type="submit" class="btn btn-primary btn-warning">Update Product Name</button>
        </form>
        </div>

@endsection