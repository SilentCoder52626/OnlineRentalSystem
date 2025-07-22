<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class FrontendController extends Controller
{
    function allProducts()
    {
        if (auth()->check()) {
            $userId = auth()->id();

            $categories = Category::with(['products' => function ($query) use ($userId) {
                $query->where('owner_id', '!=', $userId)
                    ->where('status', 1);
            }])->whereHas('products', function ($query) use ($userId) {
                $query->where('owner_id', '!=', $userId)
                    ->where('status', 1);
            })->get();

        } else {
            $categories = Category::with(['products' => function ($query) {
                $query->where('status', 1);
            }])->whereHas('products', function ($query) {
                $query->where('status', 1);
            })->get();
        }

        return view('products', compact('categories'));
    }

}
