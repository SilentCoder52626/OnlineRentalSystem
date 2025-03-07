<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id'); // Auto-incrementing primary key
            $table->integer('priority');
            $table->string('name');
            $table->string('description');
            $table->string('url');
            $table->integer('rating')->nullable();
            $table->integer('price')->nullable();
            $table->integer('discount')->nullable();
            $table->string('image1')->nullable();
            $table->string('image2')->nullable();
            $table->string('image3')->nullable();
            $table->string('image4')->nullable();
            $table->string('title')->nullable();
            $table->string('keywords')->nullable();
            $table->string('meta_description')->nullable();
            $table->string('status')->default('1');
            $table->integer('cost')->nullable();
            $table->string('payment_status')->nullable();
            $table->string('featured')->nullable();
            $table->unsignedBigInteger('owner_id')->nullable();
            $table->integer('quantity')->nullable();

            // Foreign key constraint
            $table->foreignId('category_id')->constrained('category')->onDelete('cascade');

            $table->timestamps(); // Created_at and updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
