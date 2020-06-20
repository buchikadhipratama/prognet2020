@extends('masterviews.layout')

@section('content')



              
            <div class="col-md-6 text-center">
                <h1> Products List </h1>
            </div>
            
            <!-- coloum for Add New Product -->
            <div class="col-md-12">
            <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary float-right btn-sm" data-toggle="modal" data-target="#exampleModal">
                Add New Product
                </button>
            </div>
                <!-- table start from here -->
                  <div class="row">
                    <div class="col-sm-12">
                      <table id="example2" class="table table-bordered table-hover dataTable dtr-inline" role="grid" aria-describedby="example2_info">
                        <thead>
                          <tr class="text-center">
                            <th>ID</th>
                            <th>PRODUCT NAME</th>
                            <th>PICTURE</th>
                            <th>PRICE</th>
                            <th>DESCRIPTION</th>
                            <th>PRODUCT RATE</th>
                            <th>CREATE AT</th>
                            <th>UPDATE AT</th>
                            <th>STOCK</th>
                            <th>WEIGHT</th>
                            <th>ACTION</th>
                          </tr>
                        </thead>
                        <tbody>
                        @foreach($product_data as $product)
                          <tr class="text-center">
                            <td class="text-left">{{$product->id}}</td>
                            <td class="text-left">{{$product->product_name}}</td>
                            <td>
                              <a href="/product/images/{{$product->id}}" class="btn btn-default btn-sm">
                                LIHAT
                              </a>
                            </td>
                            <td class="text-justify">{{"Rp "}}{{$product->price}}</td>
                            <td>{{$product->description}}</td>
                            <td>{{$product->product_rate}}</td>
                            <td>{{$product->created_at}}</td>
                            <td>{{$product->updated_at}}</td>
                            <td>{{$product->stock}}</td>
                            <td>{{$product->weight}}</td>
                            <td>
                              <a href="/product/edit/{{$product->id}}" class="btn btn-warning btn-sm">EDIT</a>
                              
                              <a href="/product/delete/{{$product->id}}" class="btn btn-danger btn-sm" onclick="return confirm('do you want to delete this')">DELETE</a>
                            </td>
                          </tr>
                        @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
          </div>
        </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
</section>

















<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <!-- form for create bew one wuz here -->      
        <!-- <form action="/product/create" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">Product Name</label>
                    <input name="product_name" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Prouct Name">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Price</label>
                    <input name="price" type="text" class="form-control" aria-describedby="emailHelp" placeholder="price">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Description</label>
                    <input name="description" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Description">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Product Rate</label>
                    <input name="product_rate" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Prouct Rate">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Stock</label>
                    <input name="stock" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Stock">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Weight</label>
                    <input name="weight" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Weight">
                </div>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Add New Product</button>
        </form> -->





        <form action="/product/create" method="POST" enctype="multipart/form-data" class="form">
          {{csrf_field()}}
                <div class="card-body">

                  <div class="form-group {{ $errors->has('product_name') ? 'has-error' : '' }} ">
                    <label for="product_name" class="control-label">Product Name</label>
                    <input type="text" name="product_name" class="form-control" id="product_name" placeholder="Product Name" aria-describedby="product_name" aria-invalid="true" value="{{ old('product_name')}}">
                    @if ($errors->has('product_name'))
                      <span class="help-block text-red">
                        {{ $errors->first('product_name') }}
                      </span>
                    @endif
                  </div>

                  <div class="form-group  {{ $errors->has('price') ? 'has-error' : '' }} " >
                    <label for="price" class="control-label">Price</label>
                    <input type="number" name="price" class="form-control" id="price" placeholder="price" aria-describedby="price" aria-invalid="true" value="{{ old('price')}}">
                    @if ($errors->has('price'))
                      <span id="price" class= "help-block text-red">
                        {{ $errors->first('price') }}
                      </span>
                    @endif
                  </div>

                  <div class="form-group  {{ $errors->has('description') ? 'has-error' : '' }} " >
                    <label for="description" class="control-label">Description</label>
                    <input type="text" name="description" class="form-control" id="description" placeholder="description" aria-describedby="description" aria-invalid="true" value="{{ old('description') }}" 33>
                    @if ($errors->has('description'))
                      <span id="description" class= "help-block text-red">
                        {{ $errors->first('description') }}
                      </span>
                    @endif
                  </div>

                  <div class="form-group  {{ $errors->has('product_rate') ? 'has-error' : '' }} " >
                    <label for="product_rate" class="control-label">Product Rate</label>
                    <input type="number" name="product_rate" class="form-control" id="product_rate" placeholder="Product rate" aria-describedby="product_rate" aria-invalid="true" value="{{ old('product_rate')}}" step="1" min="0" max="5">
                    @if ($errors->has('product_rate'))
                      <span id="product_rate" class= "help-block text-red">
                        {{ $errors->first('product_rate') }}
                      </span>
                    @endif
                  </div>

                  <div class="form-group {{ $errors->has('stock') ? 'has-error' : '' }} " >
                    <label for="stock" class="control-label">Stock</label>
                    <input type="number" name="stock" class="form-control" id="stock" placeholder="Stock" aria-describedby="stock" aria-invalid="true" value="{{ old('stock')}}">
                    @if ($errors->has('stock'))
                      <span id="stock" class= "help-block text-red">
                        {{ $errors->first('stock') }}
                      </span>
                    @endif
                  </div>

                  <div class="form-group  {{ $errors->has('weight') ? 'has-error' : '' }} " >
                    <label for="weight" class="control-label" >Weight</label>
                    <input type="number" name="weight" class="form-control" id="weight" placeholder="Password" aria-describedby="weight" aria-invalid="true" value="{{ old('weight')}}" step="0.01" min="0" max="999">
                    @if ($errors->has('weight'))
                      <span id="weight" class= "help-block text-red">
                        {{ $errors->first('weight') }}
                      </span>
                    @endif
                  </div>

                  <div class="form-group bmd-form-group form-file-upload form-file-multiple">
                    <label for="picture_images" class="control-label" >Picture Images</label><br>
                    <input type="file" multiple="" name="product_images[]" class="inputFileHidden">
                    <div class="input-group">
                        <input type="text" class="form-control inputFileVisible" placeholder="Product Images" multiple>
                        <span class="input-group-btn">
                        </span>
                    </div>
                  </div>

                   <!-- <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                    <option selected>Choose...</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select> -->


                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-primary">Add New Product</button>
                </div>
              </form>
      </div>
    </div>
  </div>


@endsection






