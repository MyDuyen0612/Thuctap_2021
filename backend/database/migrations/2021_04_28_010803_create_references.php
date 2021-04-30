<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReferences extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('color',function(Blueprint $table){
            $table->foreign('product_id')->references('id')->on('product');
        });
        Schema::table('size',function(Blueprint $table){
            $table->foreign('color_id')->references('id')->on('color');
        });
        Schema::table('product',function(Blueprint $table){
            $table->foreign('category_id')->references('id')->on('category');
        });
        Schema::table('invoice',function(Blueprint $table){
            $table->foreign('user_id')->references('id')->on('users');
        });
        Schema::table('invoicedetails',function(Blueprint $table){
            $table->foreign('product_id')->references('id')->on('product');
        });
        Schema::table('invoicedetails',function(Blueprint $table){
            $table->foreign('invoice_id')->references('id')->on('invoice');
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('references');
    }
}
