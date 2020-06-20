@extends('masterviews.layout')

@section('content')

<div class="row">
        <!-- coloum for name of page -->
        <div class="col-lg-12">
            <h1> Courier Edit </h1>

        <form action="/courier/update/{{$courier->id}}" method="POST"> 
                {{csrf_field()}}
                <div class="form-group">
                    <label for="exampleInputEmail1">Courier Name</label>
                    <input name="courier" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Courier Name" value="{{$courier->courier}}">
                </div>
            </div>
            <div class="modal-footer col-12 float-left">
                <a href="/courier" class="btn btn-secondary">Back</a>
                <button type="submit" class="btn btn-primary btn-warning">Update Courier</button>
        </form>
        </div>

@endsection