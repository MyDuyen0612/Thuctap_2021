<?php

namespace App\Http\Controllers;

use App\Http\Requests\ApiRegisterrRequest;
use App\Http\Requests\UserRequest;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserApiController extends Controller
{
  public function login(UserRequest $request)
  {
    if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
      $user = Auth::user();
      $token = $user->createToken("Laravel password")->accessToken;
      return response()->json(["token" => "$token", "user" => Auth::user()], 200);
    }
    return response()->json(["message" => "Tai khoan sai mat khau hoac ten"], 404);
  }
  public function register(ApiRegisterrRequest $request)
  {
    $user = new User();
    $user->fill($request->all());
    $user->password = Hash::make($request->password);
    $user->save();
    return response()->json(["message" => "Dang ky thanh cong"], 201);
  }
  public  function profile(Request $request)
  {
    return response()->json(["user" => Auth::guard('api')->user()], 200);
  }
  public function index()
  {
    return User::all();
  }
}
