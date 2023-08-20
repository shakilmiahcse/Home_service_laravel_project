<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'service_id',
        'address',
        'street_number',
        'route',
        'city',
        'state',
        'country',
        'zipcode',
        'payment_type'
    ];

    public function service()
    {
        return $this->belongsTo(Service::class);
    }
}
