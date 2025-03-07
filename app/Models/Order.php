<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table='orders';
       protected $fillable = [
        'Customer_Emailid',
        'Delivery_Address',
        'Order_Details',
        'Coupen_Code',
        'Amount',
        'payment',
        'deposite_Amount',
        'delivery_charge',
        'required_date',
        'product_id',
        'paymentmode',
        'payment_status',
        'start_date',
        'end_date',
        'p_status',
        'p_status_Updated_By',
    ];
}
