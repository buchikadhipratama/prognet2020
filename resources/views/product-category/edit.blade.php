@extends('masterviews.layout')

@section('content')

    <div class="row">
        <!-- coloum for name of page -->
        <div class="col-lg-12">
            <h1> Product Edit </h1>

        <form action="/product-category/update/{{$product_category->id}}" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">Product Category</label>
                    <input name="category_name" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Prouct Name" value="{{$product_category->category_name}}">
                </div>
            </div>
            <div class="modal-footer col-12 float-left">
              <a href="/product-category" class="btn btn-secondary">Back</a>
                <button type="submit" class="btn btn-primary btn-warning">Update Category</button>
        </form>
        </div>

@endsection



