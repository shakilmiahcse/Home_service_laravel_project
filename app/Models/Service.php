<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $table = "services";

    public function category()
    {
        return $this->belongsTo(ServiceCategory::class, "service_category_id");
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class, 'service_id');
    }
}
