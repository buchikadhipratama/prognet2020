
@extends('masterviews.layout')

@section('content')
<div class="row">
    <div class="col-sm-12">
        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline" role="grid" aria-describedby="example2_info">
            <thead>
                <tr class="text-center">
                    <th>ID</th>
                    <th>picture</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $images)
                <tr>
                    <td>{{$loop->iteration}}</td>
                    <td>
                        <img src="{{url('/product_images/'.$images->image_name)}}" style="width:260px;" alt=""> 
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    <div class="card-footer float-right">
        <a href="/product" class="btn btn-secondary">Back</a>
    </div>
    </div>
</div>


@endsection

