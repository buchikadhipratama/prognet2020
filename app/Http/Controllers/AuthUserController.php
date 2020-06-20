<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;

class AuthUserController extends Controller
{
    //Funsi Auth untuk User
    public function getLoginUser(){
        return view('loginUser');
    }

    public function postLoginUser(Request $request){
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            return redirect('/home');
        }
        return redirect()->back();
    }

    public function getRegisterUser(){
        return view('registerUser');
    }

    public function postRegisterUser(Request $request){
        $this->validate($request, [
            'name' => 'required|min:2|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6|max:24|confirmed'
        ]);

       $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'profile_image' => $request->profile_image,
            'status' => $request->status,
            'password' => bcrypt($request->password)
        ]);


        Auth::LoginUsingId($user->id);

        return redirect('/home');

        //return redirect()->back();
    }

    //Funsi Auth untuk Admin
    

    public function logout(){
        Auth::logout();
        return redirect()->route('welcome');
    }
}
