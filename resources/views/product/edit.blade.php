@extends('masterviews.layout')

@section('content')

    <div class="row">
        <!-- coloum for name of page -->
        <div class="col-lg-12">
            <h1> Product Edit </h1>

        <form action="/product/update/{{$product->id}}" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">Product Name</label>
                    <input name="product_name" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Prouct Name" value="{{$product->product_name}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Price</label>
                    <input name="price" type="text" class="form-control" aria-describedby="emailHelp" placeholder="price" value="{{$product->price}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Description</label>
                    <input name="description" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Description" value="{{$product->description}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Product Rate</label>
                    <input name="product_rate" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Prouct Rate" value="{{$product->product_rate}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Stock</label>
                    <input name="stock" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Stock" value="{{$product->stock}}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Weight</label>
                    <input name="weight" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Weight" value="{{$product->weight}}">
                </div>

                <!-- gambarnya -->
                <label for="exampleInputEmail1">Picture</label>
                <table id="example2" class="table table-bordered table-hover dataTable dtr-inline" role="grid" aria-describedby="example2_info">
                    <thead>
                        <th>Number</th>
                        <th>Picture</th>
                        <th>Action</th>
                    </thead>        
                
                @foreach ($products as $images)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td>
                                <img src="{{url('/product_images/'.$images->image_name)}}" style="width:300px;" alt=""> 
                            </td>
                            <td class="center">
                                <a href="/product-image/imagesdelete/{{$images->id}}" class="btn btn-danger btn-sm" onclick="return confirm('do you want to delete this')">DELETE</a>
                            </td>
                        </tr>
                        @endforeach
                </table>
            </div>







            <div class="modal-footer col-12 float-left">
                <a href="/product" class="btn btn-secondary">Back</a>
                <button type="submit" class="btn btn-primary btn-warning">Update Product</button>
        </form>
        </div>

@endsection



