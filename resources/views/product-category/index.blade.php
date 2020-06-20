@extends('masterviews.layout')

@section('content')


<div class="row">
    <div class="col-6">
        <h1> Category Product </h1>
    </div>

        <!-- coloum for Add New Product -->
        <div class="col-6">
        <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary float-right btn-sm" data-toggle="modal" data-target="#exampleModal">
            Add New Category
            </button>
        </div>
</div>

<table class="table table-hover">
    <thead>
        <tr>
            <th>ID</th>
            <th>CATEGORY NAME</th>
            <th>CREATED AT</th>
            <th>UPDATED AT</th>
            <th>ACTION</th>
        </tr>
    </thead>
    @foreach($product_category as $product_category)
        <tr>
            <td>{{$product_category->id}}</td>
            <td>{{$product_category->category_name}}</td>
            <td>{{$product_category->created_at}}</td>
            <td>{{$product_category->updated_at}}</td>
            <td>
            <a href="/product-category/edit/{{$product_category->id}}" class="btn btn-warning btn-sm">EDIT</a>
            <a href="/product-category/delete/{{$product_category->id}}" class="btn btn-danger btn-sm" onclick="return confirm('do you want to delete this')">DELETE</a>
            </td>
        </tr>
    @endforeach
</table>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Courier</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <!-- form for create bew one wuz here -->
        <form action="/product-category/create" method="POST">
            {{csrf_field()}}
            <div class="form-group">
                <label for="exampleInputEmail1">Category Name</label>
                <input name="category_name" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Category Name">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Add New Category</button>
            </div>
        </form>

@endsection