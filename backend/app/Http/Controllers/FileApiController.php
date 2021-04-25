<?php

namespace App\Http\Controllers;

use App\Models\Color;
use Illuminate\Http\Request;

class FileApiController extends Controller
{
    //
    public function downloadProduct(Request $request){

        $find = Color::where("image", "=", $request->url)->get();
        return view('image',[
            'color' => $find
        ]);
    }
}
