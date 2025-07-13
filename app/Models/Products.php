<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $table='products';
    protected $fillable=[
        'priority',
        'name',
        'description',
        'rating',
        'price',
        'discount',
        'url',
        'image1',
        'image2',
        'image3',
        'image4',
        'title',
        'keywords',
        'meta_description',
        'status',
        'category_id',
        'cost',
        'payment_status',
        'featured',
        'owner_id',
        'quantity',
    ];

    function category(){

        return $this->belongsTo(Category::class, 'category_id');
    }
    function owner(){

        return $this->belongsTo(User::class, 'owner_id');
    }
}
