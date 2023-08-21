<?php

namespace App\Http\Livewire\Admin;

use App\Models\Booking;
use Livewire\Component;

class AdminBookingComponenet extends Component
{
    public function render()
    {
        $bookings = Booking::paginate(15);
        return view('livewire.admin.admin-booking-componenet',['bookings'=>$bookings])->layout('layouts.base');
    }
}
