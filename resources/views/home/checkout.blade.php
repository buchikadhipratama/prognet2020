<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <select name="province_destination" id="">
        <option class="checkout__input" >--Provinsi--</option>
                                    @foreach($provinces as $province => $value)
                                        <option value="{{$province}}">{{$value}}</option>
                                    @endforeach
    </select>
    <select name="city_destination" id="">
        <option>--Kabupaten/Kota--</option>
    </select>
</body>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $('select[name=province_destination]').on('change', function(){
                let provinceId = $(this).val();
                if (provinceId) {
                    jQuery.ajax({
                        url: '/province/'+provinceId+'/cities',
                        type : "GET",
                        dataType : "json",
                        success: function(data){
                            $('select[name="city_destination"]').empty();
                            $.each(data, function(key, value){
                                $('select[name=city_destination]').append('<option value="'+ key + '">'+ value + '</option>');
                            });
                        }
                    });
                }else{
                    $('select[name="city_destination"]').empty();
                }
            });
        });
        /*$(document).ready(function(){
            $('select[name=courier]').on('change', function(){
                let courier = $(this).val();
                if (courier == 'jne') {
                    $('select[name=paket]').append('<option value="0">OKE</option>');
                    $('select[name=paket]').append('<option value="1">REG</option>');
                    $('select[name=paket]').append('<option value="2">YES</option>');
                }
            });
        });*/
    </script>
</html>