@extends('masterviews.layout')
@section('content')

<div class="row">
        <!-- coloum for name of page -->
        <div class="col-6">
            <h1> Image List </h1>
        </div>
        

        <!-- coloum for Add New Product -->
        <div class="col-6">
        <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary float-right btn-sm" data-toggle="modal" data-target="#exampleModal">
            Add New Product
            </button>
        </div>
        

<table class="table table-hover">
    <thead>
        <tr>
            <th>ID</th>
            <th>PRODUCT ID</th>
            <th>IMAGES NAME</th>
            <th>CREATED AT</th>
            <th>UPDATED AT</th>
            <th>ACTION</th>
        </tr>
    </thead>
    @foreach($product_image as $product_image)
        <tr>
            <td>{{$product_image->id}}</td>
            <td>{{$product_image->product_id}}</td>
            <td>{{$product_image->image_name}}</td>
            <td>{{$product_image->created_at}}</td>
            <td>{{$product_image->updated_at}}</td>
            <td>
                <a href="/product-image/edit/{{$product_image->id}}" class="btn btn-warning btn-sm">EDIT</a>
                <a href="/product-image/delete/{{$product_image->id}}" class="btn btn-danger btn-sm" onclick="return confirm('do you want to delete this')">DELETE</a>
            </td>
        </tr>
    @endforeach
</table>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Image</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <!-- form for create bew one wuz here -->
        <form action="/product-image/create" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">PRODUCT ID</label>
                    <input name="product_id" type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Product ID">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1"><P>IMAGE NAME</P></label>
                    <input name="image_name" type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Image Name">
                </div>
        </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Add New Image</button>
        </form>
      </div>
    </div>
  </div>


@endsection