<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('Customer_Emailid');
            $table->text('Delivery_Address');
            $table->text('Order_Details')->nullable();
            $table->string('Coupen_Code')->nullable();
            $table->decimal('Amount', 10, 2);
            $table->decimal('payment', 10, 2);
            $table->decimal('deposite_Amount', 10, 2)->nullable();
            $table->decimal('delivery_charge', 10, 2)->nullable();
            $table->date('required_date')->nullable();
            $table->unsignedBigInteger('product_id');
            $table->string('paymentmode');
            $table->tinyInteger('payment_status')->default(0);
            $table->date('start_date');
            $table->date('end_date');
            $table->string('p_status')->nullable();
            $table->unsignedBigInteger('p_status_Updated_By')->nullable();
            $table->timestamps();

            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('_orders');
    }
}
