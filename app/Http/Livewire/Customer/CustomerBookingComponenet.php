<?php

namespace App\Http\Livewire\Customer;

use App\Models\Booking;
use Livewire\Component;

class CustomerBookingComponenet extends Component
{
    public $bookings;

    public function mount()
    {
        $this->bookings = Booking::where('user_id', auth()->user()->id)->get();
    }

    public function render()
    {
        return view('livewire.customer.customer-booking-componenet')->layout('layouts.base');
    }
}
