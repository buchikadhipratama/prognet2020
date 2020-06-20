@extends('masterviews.layout')

@section('content')

<div class="row">
    <div class="col-6">
        <h1> Discount List </h1>
    </div>

        <!-- coloum for Add New Product -->
        <div class="col-6">
        <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary float-right btn-sm" data-toggle="modal" data-target="#exampleModal">
            Add New Discount
            </button>
        </div>
</div>

<table class="table table-hover">
    <thead>
        <tr>
            <th>ID</th>
            <th>ID PRODUCT</th>
            <th>PERCENTAGE</th>
            <th>START</th>
            <th>END</th>
            <th>CREATED AT</th>
            <th>UPDATED AT</th>
            <th>ACTION</th>
        </tr>
    </thead>
    @foreach($discount as $discount)
    <tr>
        <td>{{$discount->id}}</td>
        <td>{{$discount->id_product}}</td>
        <td>{{$discount->percentage}}</td>
        <td>{{$discount->start}}</td>
        <td>{{$discount->end}}</td>
        <td>{{$discount->created_at}}</td>
        <td>{{$discount->updated_at}}</td>
        <td>
            <a href="/discount/edit/{{$discount->id}}" class="btn btn-warning btn-sm">EDIT</a>
            |
            <a href="/discount/delete/{{$discount->id}}" class="btn btn-danger btn-sm" onclick="return confirm('do you want to delete this?')">DELETE</a>
        </td>
    </tr>
    @endforeach
</table>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New discount</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <!-- form for create bew one wuz here -->
        <form action="/discount/create" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">PRODUCT ID</label>
                    <input name="id_product" type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Product ID">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1"><P>PERCENTAGE</P></label>
                    <input name="percentage" type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Percentage">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">START</label>
                    <input name="start" type="text" class="form-control" placeholder="yyyy-mm-dd">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">END</label>
                    <input name="end" type="text" class="form-control" placeholder="yyyy-mm-dd">
                </div>
        </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Add New discount</button>
        </form>


      </div>
    </div>
  </div>


@endsection