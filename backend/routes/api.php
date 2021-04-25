<?php

use App\Http\Controllers\CategoryApiController;
use App\Http\Controllers\FileApiController;
use App\Http\Controllers\ProductApiController;
use App\Http\Controllers\UserApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post("/login",[UserApiController::class, 'login']);
Route::post("/register",[UserApiController::class, 'register']);
Route::get("/profile",[UserApiController::class, 'profile']);
Route::get("/listuser",[UserApiController::class, 'index']);

Route::apiResource("/category", CategoryApiController::class);
Route::apiResource("/product", ProductApiController::class);

