<?php

namespace App\Http\Controllers;

use App\Http\Requests\ApiProductRequest;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\Size;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $product = Product::all();
        foreach ($product as $value) {
            $value->category;
            foreach($value->color as $value1){
                $value1->size;
            }

        }
        return response()->json(['data' => $product], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ApiProductRequest $request)
    {
        try {

            DB::beginTransaction();

            $product = json_decode($request->product); // từ form chuyển về json xl

            $newProduct = new Product();
            $newProduct->name = $product->name;
            $newProduct->price = $product->price;
            $newProduct->describe = $product->describe;
            $newProduct->url = Str::slug($product->name);

            $category = Category::find($product->category->id);
            if (!$category) {
                return response()->json(['message' => "false"], 404);
            }
            //Save Product Category
            $category->product()->save($newProduct);
            foreach ($product->color as $indexcolor => $color) {
                $newColor = new Color();
                $newColor->name = $color->name;
                $newColor->code = $color->code;

                if ($request->hasFile('image')) {

                    foreach ($request->image as $indeximg => $img) {
                        if ($indeximg == $indexcolor) {
                            $file = $img;
                            $extension =  $file->getClientOriginalExtension();
                            $filename = Str::slug($product->name . $color->name) . '.' . $extension;
                            $file->move('image/product', $filename);
                            $newColor->image = $filename;
                            $newColor->urlimg = 'http://'.request()->getHost().':8000/image/product/'.$filename;
                        }
                    }
                }
                $newProduct->color()->save($newColor);
                foreach ($color->size as $size) {
                    $newSize = new Size();
                    $newSize->name = $size->name;
                    $newSize->amount = $size->amount;

                    $newColor->size()->save($newSize);
                }
            }
            DB::commit();
            return response()->json(['message' => "true"], 201);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['message' => "false","error"=>$e->getMessage()], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $find =  Product::find($id);
        if($find){
            $find->category;
            foreach($find->color as $value1){
                 $value1->size;
            }
            return response()->json(['data' => $find], 200);
        }

        return response()->json(['message' => "Khong tim thay"], 404);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();

            $product = $request['product'];
            $updateProduct = Product::find($id);
            $updateProduct->name = $product['name'];
            $updateProduct->price = $product['price'];
            $updateProduct->describe = $product['describe'];
            $updateProduct->url = Str::slug($product['name']);
            $category = Category::find($product['category']['id']);
            if (!$category) {
                return response()->json(['message' => "false"], 404);
            }
            //Save Product Category
            $category->product()->save($updateProduct);
            DB::commit();
            return response()->json(['message' => "true"], 200);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['message' => "false", 'error'=> $e->getMessage()], 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $product = Product::find($id);
            if ($product) {
                $color = Color::where("product_id", "=", $id)->get();
                if($color){
                    foreach($color as $item){
                        $size = Size::where("color_id", "=", $item['id']);
                        if($size){
                            $size->delete();
                        }
                    }
                }
                $color = Color::where("product_id", "=", $id);
                if($color){
                    $color->delete();
                }
                $product->delete();
                return response()->json(['message' => "true"], 200);
            }
            else{
                return response()->json(['message' => "false"], 404);
            }
        } catch (Exception $e) {
            return response()->json(['message' => "false", 'error' => $e->getMessage(),], 400);
        }
    }
}
