<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


//Route Default
Route::get('/', function () {
    return view('welcome');
})->name('welcome');


//Route User
Route::get('/userhome', function () {
  return view('userHome');
})->middleware('auth:user')->name('userhome');

Route::get('/registeruser', 'AuthUserController@getRegisterUser')->middleware('guest');
Route::post('/registeruser', 'AuthUserController@postRegisterUser')->name('registeruser')->middleware('guest');

Route::get('/loginuser', 'AuthUserController@getLoginUser')->middleware('guest');
Route::post('/loginuser', 'AuthUserController@postLoginUser')->name('loginuser')->middleware('guest');

Route::get('/logout/user', 'AuthUserController@logout')->name('logout')->middleware('auth:user');


//Route Admin
Route::get('/adminhome', 'AuthAdminController@index')->middleware('auth:admin')->name('adminhome');

Route::get('/admin','AuthAdminController@index')->name('admin');



Route::get('/registeradmin', 'AuthAdminController@getRegisterAdmin')->middleware('guest');
Route::post('/registeradmin', 'AuthAdminController@postRegisterAdmin')->name('registeradmin')->middleware('guest');

Route::get('/loginadmin', 'AuthAdminController@getLoginAdmin')->middleware('guest');
Route::post('/loginadmin', 'AuthAdminController@postLoginAdmin')->name('loginadmin')->middleware('guest');

Route::get('/logout/admin', 'AuthAdminController@logout')->name('logoutadmin')->middleware('auth:admin');


//test route 25 maret 2020
Route::get('/test', function () {
    return view('test');
});

//route CRUD Product
Route::get('/product/layout','ProductController@testing');
Route::get('/product','ProductController@index');
Route::post('/product/create','ProductController@create');
Route::get('/product/edit/{id}','ProductController@edit');
Route::post('/product/update/{id}','ProductController@update');
Route::get('/product/delete/{id}','ProductController@delete');
Route::get('/product/images/{id}','ProductController@images');
Route::get('/product/images-delete/{id}','ProductController@deleteimage');

//route CRUD Courier
Route::get('/courier','CourierController@index');
Route::post('/courier/create','CourierController@create');
Route::get('/courier/edit/{id}','CourierController@edit');
Route::post('/courier/update/{id}','CourierController@update');
Route::get('/courier/delete/{id}','CourierController@delete');

//Route CRUD Discount
Route::get('/discount','DiscountController@index');
Route::post('/discount/create','DiscountController@create');
Route::get('/discount/edit/{id}','DiscountController@edit');
Route::post('/discount/update/{id}',"DiscountController@update");
Route::get('/discount/delete/{id}','DiscountController@delete');

//Route CRUD Product Category
Route::get('/product-category','ProductCategoryController@index');
Route::post('/product-category/create','ProductCategoryController@create');
Route::get('/product-category/edit/{id}','ProductCategoryController@edit');
Route::post('/product-category/update/{id}','ProductcategoryController@update');
Route::get('/product-category/delete/{id}','ProductCategoryController@delete');


//Route CRUD Product Image
Route::get('/product-image','ProductImageController@index');
Route::post('/product-image/create','ProductImageController@create');
Route::get('/product-image/edit/{id}','ProductImageController@edit');
Route::post('/product-image/update/{id}','ProductImageController@update');
Route::get('/product-image/delete/{id}','ProductImageController@delete');
Route::get('/product-image/imagesdelete/{id}','ProductImageController@deleteimage');

//Route CRUD Category Detail

//Route User
Route::get('/home','UserController@index');
Route::get('/home/detail/{id}','UserController@show');
Route::get('/home/cart','UserController@show');
Route::post('/home/cart', 'CartController@store');
Route::resource('carts', 'CartController');
Route::patch('/carts/checkout/{id}', 'CartController@checkout_status');
Route::resource('transactions', 'TransactionController');
Route::get('/province/{id}/cities', 'TransactionController@getCities');
Route::get('/destination/service', 'TransactionController@getService');
Route::get('/destination/cost', 'TransactionController@getOngkir');
Route::get('/users/{id}/invoice', 'UserController@invoice');
Route::get('/users/invoice/{id}', 'UserController@getInvoice');
Route::patch('/uploadPOP/{id}', 'UserController@uploadPOP');
Route::get('/marknotif', 'UserController@marknotif');
Route::patch('/transactions/cancel/{id}', 'UserController@cancel_transaction');

Route::patch('/transaction/success/{id}', 'UserController@confirmation');

Route::resource('reviews', 'ReviewController');

Route::get('/test', function () {
    return view('home.checkout');
});



Route::get('/admin/order/new', 'AuthAdminController@orderNew');
Route::get('/admin/order/process', 'AuthAdminController@orderProces');
Route::get('/admin/order/success', 'AuthAdminController@orderSuccess');
Route::get('/admin/order/cek/{id}', 'AuthAdminController@orderDetail');
Route::get('/admin/order/cancel', 'AuthAdminController@orderCancel');
Route::get('/admin/order/cancel', 'AuthAdminController@orderCancel');
Route::patch('/order/update/{id}', 'AuthAdminController@orderUpdate');
Route::get('admin/marknotifadmin', 'AuthAdminController@markReadAdmin');