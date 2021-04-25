<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'product';
    protected $primaryKey = 'id';
    protected $attributes = [
        'status' => "Đang bán",
    ];
    protected $fillable = [
        'name',
        'price',
        'describe',
        'url',
    ];
    public function category(){
        return $this->belongsTo(Category::class);
    }
    public function color(){
        return $this->hasMany(Color::class);
    }
}
