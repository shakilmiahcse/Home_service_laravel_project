<?php

namespace App\Http\Livewire;

use App\Models\Booking;
use App\Models\Service;
use Livewire\Component;

class BookingService extends Component
{
    public $service_id;
    public $address;
    public $street_number;
    public $route;
    public $city;
    public $state;
    public $country;
    public $zipcode;
    public $payment_type;

    protected $rules = [
        'service_id' => 'required|exists:services,id',
        'address' => 'required|string',
        'street_number' => 'required|string',
        'route' => 'required|string',
        'city' => 'required|string',
        'state' => 'required|string',
        'country' => 'required|string',
        'zipcode' => 'required|string',
        'payment_type' => 'required|in:cash,card',
    ];


    public $slug;

    public function mount()
{
    $this->slug = request()->query('slug');
}
    
    public function render()
    {
        // $service = Service::where('slug',$this->service_slug)->first(); ,['service'=>$service]
        return view('livewire.booking-service')->layout('layouts.base');
    }

    public function bookService()
    {
        // Find the service by slug
        $service = Service::where('slug', $this->slug)->first();
       
        // $this->validate();
        

        // Create a booking record here using the validated data
        $booking = Booking::create([
            'user_id' => auth()->user()->id,
            'service_id' => $service->id,
            'address' => 'A fake address',
            'street_number' => $this->street_number,
            'route' => $this->route,
            'city' => $this->city,
            'state' => $this->state,
            'country' => $this->country,
            'zipcode' => $this->zipcode,
            'payment_type' => 'cash',
        ]);
        // old code by sakil 
        // $booking = Booking::create([
        //     'user_id' => auth()->user()->id,
        //     'service_id' => $this->service->id,
        //     'address' => $this->address,
        //     'street_number' => $this->street_number,
        //     'route' => $this->route,
        //     'city' => $this->city,
        //     'state' => $this->state,
        //     'country' => $this->country,
        //     'zipcode' => $this->zipcode,
        //     'payment_type' => $this->payment_type,
        // ]);

        // Optionally, you can add more logic here (e.g., send confirmation emails)
        // dd($this->payment_type);
        // Redirect to a success page or show a success message
        session()->flash('message', 'Booking successful!');
    }
}
