<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    use HasFactory;
    protected $table = 'color';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'code',
        'image',
        'urlimg',
    ];
    public function product(){
        return $this->belongsTo(Product::class);
    }
    public function size(){
        return $this->hasMany(Size::class);
    }
}
